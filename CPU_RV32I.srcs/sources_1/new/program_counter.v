`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2025 02:32:11 PM
// Design Name: 
// Module Name: program_counter
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


module program_counter(
    input               CLK, 
    input               RES, 
    input       [31:0]  PC_next, 
    input               PC_write, 
    output reg  [31:0]  PC
);


always @(posedge CLK) begin
    // リセット
    if(RES == 1'b1)
        PC <= 32'h0;
    // PC更新
    else if(PC_write == 1'b1)
        PC <= PC_next;
    // PC維持
    else
        PC <= PC;
end
endmodule
