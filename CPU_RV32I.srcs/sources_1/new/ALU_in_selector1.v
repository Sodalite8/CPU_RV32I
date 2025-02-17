`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2025 04:03:23 PM
// Design Name: 
// Module Name: ALU_in_selector1
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


module ALU_in_selector1(
    input           ALU_source1,
    input   [31:0]  reg_out1, PC,
    output  [31:0]  ALU_in1
);


    assign ALU_in1 = (ALU_source1) ? PC : reg_out1;
endmodule
