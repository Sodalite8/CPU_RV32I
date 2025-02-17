`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2025 04:10:34 PM
// Design Name: 
// Module Name: PC_adder_selector1
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


module PC_adder_selector1(
    input           PC_adder_source1,
    input   [31:0]  PC, reg_out1,
    output  [31:0]  PC_adder_in1
);
    
    
    assign PC_adder_in1 = (PC_adder_source1) ? reg_out1 : PC;
endmodule
