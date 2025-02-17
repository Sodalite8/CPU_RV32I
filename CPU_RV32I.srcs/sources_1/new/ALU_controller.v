`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/17/2025 02:27:33 PM
// Design Name: 
// Module Name: ALU_controller
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


module ALU_controller(
    input       [6:0]   func7,
    input       [2:0]   func3,
    input       [3:0]   inst_type,
    output reg  [3:0]   ALU_control
);


always @(func7 or func3 or inst_type) begin
    case(inst_type)
        `INST_R_CALC, `INST_I_CALC : begin
            case(func3)
                3'b000 : begin
                    case(inst_type)
                        `INST_R_CALC : begin
                            ALU_control <= (func7[5]) ? `ALU_SUB : `ALU_ADD;
                        end
                        
                        `INST_I_CALC : begin
                            ALU_control <= `ALU_ADD;
                        end
                        
                        default : begin
                            ALU_control <= `ALU_NOP;
                        end
                    endcase
                end
                
                3'b001 : begin
                    ALU_control <= `ALU_SLL;
                end
                
                3'b010 : begin
                    ALU_control <= `ALU_SLT;
                end
                
                3'b011 : begin
                    ALU_control <= `ALU_SLTU;
                end
                
                3'b100 : begin
                    ALU_control <= `ALU_XOR;
                end
                
                3'b101 : begin
                    ALU_control <= (func7[5]) ? `ALU_SRA : `ALU_SRL;
                end
                
                3'b110 : begin
                    ALU_control <= `ALU_OR;
                end
                
                3'b111 : begin
                    ALU_control <= `ALU_AND;
                end
            endcase
        end
        
        `INST_LOAD, `INST_STORE, `INST_JALR, `INST_JAL : begin
            ALU_control <= `ALU_ADD;
        end
        
        `INST_BRANCH : begin
            ALU_control <= `ALU_SUB;
        end
        
        `INST_LUI : begin
            ALU_control <= `ALU_LUI;
        end
        
        `INST_AUIPC : begin
            ALU_control <= `ALU_AUIPC;
        end
        
        default : begin
            ALU_control <= `ALU_NOP;
        end
    endcase
end
endmodule
