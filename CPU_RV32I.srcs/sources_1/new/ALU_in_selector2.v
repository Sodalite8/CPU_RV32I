`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2025 04:06:03 PM
// Design Name: 
// Module Name: ALU_in_selector2
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


module ALU_in_selector2(
    input   [1:0]   ALU_source2, 
    input   [31:0]  reg_out2, imm, imm_four, 
    output  [31:0]  ALU_in2
);


    assign ALU_in2 =    (ALU_source2 == 2'b00) ? reg_out2 : 
                        (ALU_source2 == 2'b01) ? imm : 
                        (ALU_source2 == 2'b10) ? imm_four : 32'h0;
endmodule
