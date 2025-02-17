`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/17/2025 07:37:07 PM
// Design Name: 
// Module Name: memory
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


module memory(
    input           CLK,
    input           read, write,
    input   [31:0]  addr, data_in,
    output  [31:0]  data_out
);
    parameter MEMORY_SIZE = 256;
    reg [7:0] mem [(MEMORY_SIZE - 1):0];
    
    
    assign data_out =   (read == 1'b0) ? data_out :
                        (addr == 32'h0) ? 32'h00000000 :
                        (addr == 32'h4) ? 32'h00000004 :
                        {mem[addr], mem[addr + 1], mem[addr + 2], mem[addr + 3]};
    
    always @(posedge CLK) begin
        if(write) begin
            {mem[addr], mem[addr + 1], mem[addr + 2], mem[addr + 3]} <= data_in;
        end
    end
endmodule
