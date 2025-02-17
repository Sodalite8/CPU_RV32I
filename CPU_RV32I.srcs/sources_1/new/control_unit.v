`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2025 04:59:35 PM
// Design Name: 
// Module Name: control_unit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


`include "constants.v"


module control_unit(
    input               CLK, RES,
    input       [6:0]   opcode,
    output reg          inst_write,
    output reg  [3:0]   inst_type,
    output reg          reg_write,
    output reg          ALU_source1,
    output reg  [1:0]   ALU_source2,
    output reg          PC_adder_source1,
    output reg          inst_or_data, mem_read, mem_write, ALU_or_mem,
    output reg          is_decode, is_branch, is_jump
);
    reg [2:0]   current_state, next_state;


    always @(posedge CLK) begin
        if(RES == 1'b0)
            current_state <= `FETCH;
        else
            current_state <= next_state;
    end
    
    
    always @(current_state or opcode) begin
        case(current_state)
            `FETCH : begin
                next_state <= `DECODE;
            end
            
            `DECODE : begin
                next_state <= `EXECUTE;
            end
                
            `EXECUTE : begin
                case(opcode)
                    `OP_R_TYPE, `OP_I_TYPE_CALC, `OP_I_TYPE_JALR, 
                    `OP_U_TYPE_LUI, `OP_U_TYPE_AUIPC, `OP_J_TYPE :
                        next_state <= `WRITEBACK;
                    
                    `OP_B_TYPE :
                        next_state <= `FETCH;
                    
                    default :
                        next_state <= `MEM_ACCESS;
                endcase
            end
            
            `MEM_ACCESS : begin
                case(opcode)
                    `OP_S_TYPE :
                        next_state <= `FETCH;
                        
                    default :
                        next_state <= `WRITEBACK;
                endcase
            end
            
            `WRITEBACK : begin
                next_state <= `FETCH;
            end
            
            default : begin
                next_state <= `FETCH;
            end
        endcase
    end


    always @(current_state or opcode) begin
        inst_write          <= 1'b0;
        inst_type           <= `INST_NOP;
        reg_write           <= 1'b0;
        ALU_source1         <= 1'b0;
        ALU_source2         <= 2'b00;
        PC_adder_source1    <= 1'b0;
        inst_or_data        <= 1'b0;
        mem_read            <= 1'b0;
        mem_write           <= 1'b0;
        ALU_or_mem          <= 1'b0;
        is_decode           <= 1'b0;
        is_branch           <= 1'b0;
        is_jump             <= 1'b0;
        
        case(current_state)
            `FETCH : begin
                inst_write      <= 1'b1;
                mem_read        <= 1'b1;
            end
            
            `DECODE : begin
                is_decode       <= 1'b1;
            end
            
            `EXECUTE : begin
                case(opcode)
                    `OP_R_TYPE : begin
                        inst_type           <= `INST_R_CALC;
                    end
                    
                    `OP_I_TYPE_CALC : begin
                        inst_type           <= `INST_I_CALC;
                        ALU_source2         <= 2'b01;
                    end
                    
                    `OP_I_TYPE_JALR : begin
                        inst_type           <= `INST_JALR;
                        ALU_source1         <= 1'b1;
                        ALU_source2         <= 2'b10;
                        PC_adder_source1    <= 1'b1;
                        is_jump             <= 1'b1;
                    end
                    
                    `OP_I_TYPE_LOAD : begin
                        inst_type           <= `INST_LOAD;
                        ALU_source2         <= 2'b01;
                    end
                    
                    `OP_S_TYPE : begin
                        inst_type           <= `INST_STORE;
                        ALU_source2         <= 2'b01;
                    end
                    
                    `OP_B_TYPE : begin
                        inst_type           <= `INST_BRANCH;
                        is_branch           <= 1'b1;
                    end
                    
                    `OP_U_TYPE_LUI : begin
                        inst_type           <= `INST_LUI;
                        ALU_source2         <= 2'b01;
                    end
                    
                    `OP_U_TYPE_AUIPC : begin
                        inst_type           <= `INST_AUIPC;
                        ALU_source1         <= 1'b1;
                        ALU_source2         <= 2'b01;
                    end
                    
                    `OP_J_TYPE : begin
                        inst_type           <= `INST_JAL;
                        ALU_source1         <= 1'b1;
                        ALU_source2         <= 2'b10;
                        is_jump             <= 1'b1;
                    end
                        
                    default : begin
                    end
                endcase
            end
            
            `MEM_ACCESS : begin
                case(opcode)
                    `OP_I_TYPE_LOAD : begin
                        mem_read            <= 1'b1;
                    end
                    
                    `OP_S_TYPE : begin
                        mem_write           <= 1'b1;
                    end
                    
                    default : begin
                    end
                endcase
            end
            
            `WRITEBACK : begin
                case(opcode)
                    `OP_R_TYPE, `OP_I_TYPE_CALC, `OP_I_TYPE_JALR,
                    `OP_U_TYPE_LUI, `OP_U_TYPE_AUIPC, `OP_J_TYPE : begin
                        reg_write           <= 1'b1;
                    end
                    
                    `OP_I_TYPE_LOAD : begin
                        reg_write           <= 1'b1;
                        ALU_or_mem          <= 1'b1;
                    end
                    
                    default : begin
                    end
                endcase
            end
            
            default : begin
            end
        endcase
    end
endmodule
