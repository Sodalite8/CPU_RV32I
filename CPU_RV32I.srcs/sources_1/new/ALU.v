`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/17/2025 05:38:58 PM
// Design Name: 
// Module Name: ALU
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


module ALU(
    input               control,
    input       [31:0]  in1, in2,
    output reg  [31:0]  out
);


    always @(control or in1 or in2) begin
        case(control)
            `ALU_NOP : begin
                out <= 32'h0;
            end
            
            `ALU_ADD : begin
                out <= in1 + in2;
            end
            
            `ALU_SUB : begin
                out <= in1 - in2;
            end
            
            `ALU_SLT : begin
                out <= ($signed(in1) < $signed(in2)) ? 32'b1 : 32'b0;
            end
            
            `ALU_SLTU : begin
                out <= (in1 < in2) ? 32'b1 : 32'b0;
            end
            
            `ALU_SLL : begin
                out <= in1 << in2[4:0];
            end
            
            `ALU_SRL : begin
                out <= in1 >> in2[4:0];
            end
            
            `ALU_SRA : begin
                out <= in1 >>> in2[4:0];
            end
            
            `ALU_AND : begin
                out <= in1 & in2;
            end
            
            `ALU_OR : begin
                out <= in1 | in2;
            end
            
            `ALU_XOR : begin
                out <= in1 ^ in2;
            end
            
            `ALU_LUI : begin
                out <= in2 << 4'hC;
            end
            
            `ALU_AUIPC : begin
                out <= in1 + (in2 << 4'hC);
            end
        endcase
    end
endmodule
