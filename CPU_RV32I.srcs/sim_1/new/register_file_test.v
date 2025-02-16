`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2025 03:43:02 PM
// Design Name: 
// Module Name: register_file_test
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


module register_file_test();
    reg             CLK;
    reg             write;
    reg     [4:0]   rs1, rs2, rd;
    reg     [31:0]  data_in;
    wire    [31:0]  data_out1, data_out2;
    
    parameter       CLK_PERIOD = 100;
    
    
    register_file register_file(
        .CLK(CLK),
        .write(write), 
        .rs1(rs1),
        .rs2(rs2),
        .rd(rd),
        .data_in(data_in),
        .data_out1(data_out1),
        .data_out2(data_out2)
    );
    
    
    initial begin
        CLK = 1'b1;
        rs1 = 5'h0;
        rs2 = 5'h0;
        rd = 5'h1;
        write = 1'b1;
        data_in = 32'h4;
    end
    
    always begin
        #(CLK_PERIOD / 2)   CLK = ~CLK;
    end
    
    always begin
        #(CLK_PERIOD)       rs2 = 5'h1;
                            rd = 5'h2;
        #(CLK_PERIOD)       rs2 = 5'h2;
                            rd = 5'h3;
        #(CLK_PERIOD)       rs2 = 5'h3;
                            rd = 5'h4;
                            write = 1'b0;
        #(CLK_PERIOD)       rs2 = 5'h4;
        #(CLK_PERIOD)       write = 1'b1;
        #(CLK_PERIOD * 4)   $finish;       
    end
endmodule
