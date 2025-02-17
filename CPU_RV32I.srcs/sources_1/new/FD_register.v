`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/17/2025 09:03:27 PM
// Design Name: 
// Module Name: FD_register
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


module FD_register(
    input               CLK,
    input               inst_write,
    input       [31:0]  PC_IF, inst,
    output reg  [31:0]  PC_ID,
    output      [4:0]   inst31_27,
    output      [1:0]   inst26_25,
    output      [4:0]   inst24_20, inst19_15, inst11_7,
    output      [2:0]   inst14_12,
    output      [6:0]   inst_6_0,
    output reg  [31:0]  imm
);
    reg [31:0] inst_reg;
    
    
    always @(posedge CLK) begin
        if(inst_write) begin
            PC_ID       <= PC_IF;
            inst_reg    <= inst;
        end
    end
    
    // split instruction
    assign {inst31_27, inst26_25, inst24_20, inst19_15, inst14_12, inst11_7, inst6_0}
            = inst_reg;
    
    // generate immediate
    always @(inst_reg) begin
        // OP_R_TYPE or initial value
        imm <= 32'h0;
    
        // imm[31:20]
        case(inst_reg)
            `OP_I_TYPE_CALC, `OP_I_TYPE_JALR, `OP_I_TYPE_LOAD,
            `OP_S_TYPE, `OP_B_TYPE, `OP_J_TYPE : begin
                imm[31:20]  <= {12{inst[31]}};
            end
            
            `OP_U_TYPE_LUI, `OP_U_TYPE_AUIPC : begin
                imm[31:20]  <= inst[31:20];
            end
        endcase
        
        // imm[19:12]
        case(inst_reg)
            `OP_I_TYPE_CALC, `OP_I_TYPE_JALR, `OP_I_TYPE_LOAD,
            `OP_S_TYPE, `OP_B_TYPE : begin
                imm[19:12]  <= {8{inst[31]}};
            end
            
            `OP_U_TYPE_LUI, `OP_U_TYPE_AUIPC, `OP_J_TYPE : begin
                imm[19:12]  <= inst[19:12];
            end
        endcase
        
        // imm[11]
        case(inst_reg)
            `OP_I_TYPE_CALC, `OP_I_TYPE_JALR, `OP_I_TYPE_LOAD,
            `OP_S_TYPE : begin
                imm[11]     <= inst[31];
            end
            
            `OP_B_TYPE : begin
                imm[11]     <= inst[7];
            end
            
            `OP_U_TYPE_LUI, `OP_U_TYPE_AUIPC : begin
                imm[11]     <= 1'b0;
            end
            
            `OP_J_TYPE : begin
                imm[11]     <= inst[20];
            end
        endcase
        
        // imm[10:5]
        case(inst_reg)
            `OP_I_TYPE_CALC, `OP_I_TYPE_JALR, `OP_I_TYPE_LOAD,
            `OP_S_TYPE, `OP_B_TYPE, `OP_J_TYPE : begin
                imm[10:5]   <= inst[30:25];
            end
            
            `OP_U_TYPE_LUI, `OP_U_TYPE_AUIPC : begin
                imm[10:5]   <= 6'b0;
            end
        endcase
        
        // imm[4:1]
    end
endmodule
