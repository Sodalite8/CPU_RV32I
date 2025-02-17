`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/17/2025 04:31:11 PM
// Design Name: 
// Module Name: PC_selector
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


module PC_selector(
    input           PC_source,
    input   [31:0]  PC_plus_four, PC_adder_out,
    output  [31:0]  PC_next
);


    assign PC_next = (PC_source) ? PC_adder_out : PC_plus_four;
endmodule
