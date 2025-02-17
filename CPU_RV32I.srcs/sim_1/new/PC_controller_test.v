`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/17/2025 05:15:01 PM
// Design Name: 
// Module Name: PC_controller_test
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


module PC_controller_test();
    reg             is_decode, is_branch, is_jump;
    reg     [2:0]   func3;
    reg     [31:0]  ALU_out;
    wire            PC_write, PC_source;
    
    parameter       CLK_PERIOD = 10;    
    
    
    PC_controller PC_controller(
        .is_decode(is_decode),
        .is_branch(is_branch),
        .is_jump(is_jump),
        .func3(func3),
        .ALU_out(ALU_out),
        .PC_write(PC_write),
        .PC_source(PC_source)
    );


    initial begin
            is_decode   = 1'b0;
            is_branch   = 1'b0;
            is_jump     = 1'b0;
            func3       = 3'b000;
            ALU_out     = 32'h0;
        #CLK_PERIOD
            is_decode   = 1'b1;
        #CLK_PERIOD
            is_decode   = 1'b0;
            is_jump     = 1'b1;
        #CLK_PERIOD
            is_jump     = 1'b0;
            is_branch   = 1'b1;
        #CLK_PERIOD
            ALU_out     = 32'h4;
        #CLK_PERIOD
            func3       = 3'b001;
        #CLK_PERIOD
            ALU_out     = 32'h0;
        #CLK_PERIOD $finish;
    end
endmodule
