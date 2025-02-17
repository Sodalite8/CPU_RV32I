`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2025 03:37:22 PM
// Design Name: 
// Module Name: register_file
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


module register_file(
    input           CLK,
    input           write,
    input   [4:0]   rs1, rs2, rd,
    input   [31:0]  data_in,
    output  [31:0]  data_out1, data_out2
);
    reg [31:0]  register[31:0];
    
    
    assign data_out1 = (rs1 == 5'h0) ? 32'h0 : register[rs1];
    assign data_out2 = (rs2 == 5'h0) ? 32'h0 : register[rs2];
    
    always @(posedge CLK) begin
        if(write) begin
            register[rd] <= data_in;
        end
    end
endmodule
