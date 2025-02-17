`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/17/2025 08:31:12 PM
// Design Name: 
// Module Name: memory_test
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


module memory_test();
    reg             CLK;
    reg             read, write;
    reg     [31:0]  addr, data_in;
    wire    [31:0]  data_out;

    parameter CLK_PERIOD = 10;


    memory memory(
        .CLK(CLK),
        .read(read),
        .write(write),
        .addr(addr),
        .data_in(data_in),
        .data_out(data_out)
    );


    initial begin
        CLK = 1'b1;
    end
    
    always begin
        #(CLK_PERIOD / 2)
            CLK = ~CLK;
    end
    
    initial begin
            read = 1'b0;
            write = 1'b0;
            addr = 32'h0;
            data_in = 32'hA;
        #CLK_PERIOD
            read = 1'b1;
        #CLK_PERIOD
            read = 1'b0;
        #CLK_PERIOD
            addr = 32'hF;
            write = 1'b1;
        #CLK_PERIOD
            read = 1'b1;
            write = 1'b0;
        #CLK_PERIOD
            $finish;
    end
endmodule
