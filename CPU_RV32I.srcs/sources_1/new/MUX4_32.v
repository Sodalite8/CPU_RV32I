`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/17/2025 07:33:41 PM
// Design Name: 
// Module Name: MUX4_32
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


module MUX4_32(
    input   [1:0]   control,
    input   [31:0]  in1, in2, in3, in4,
    output  [31:0]  out
);

    assign out =    (control == 2'b00) ? in1 :
                    (control == 2'b01) ? in2 :
                    (control == 2'b10) ? in3 : in4;
endmodule
