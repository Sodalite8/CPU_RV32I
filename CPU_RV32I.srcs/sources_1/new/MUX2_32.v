`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/17/2025 07:18:51 PM
// Design Name: 
// Module Name: MUX2_32
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


module MUX2_32(
    input           control,
    input   [31:0]  in1, in2,
    output  [31:0]  out
);


    assign out = (control) ? in2 : in1;
endmodule
