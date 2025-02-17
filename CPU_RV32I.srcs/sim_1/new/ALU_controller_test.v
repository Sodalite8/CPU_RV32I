`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/17/2025 03:56:05 PM
// Design Name: 
// Module Name: ALU_controller_test
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


module ALU_controller_test();
    reg     [6:0]   func7;
    reg     [2:0]   func3;
    reg     [3:0]   inst_type;
    wire    [3:0]   ALU_control;
    
    parameter       CLK_PERIOD = 10;    
    
    
    ALU_controller ALU_controller(
        .func7(func7),
        .func3(func3),
        .inst_type(inst_type),
        .ALU_control(ALU_control)
    );


    initial begin
            inst_type   = 4'b0000;
            func3       = 3'b000;
            func7       = 7'b0000000;
        #CLK_PERIOD
            inst_type   = 4'b0001;
            func3       = 3'b000;
            func7       = 7'b0000000;
        #CLK_PERIOD
            func7       = 7'b0100000;
        #CLK_PERIOD
            func3       = 3'b001;
            func7       = 7'b0000000;
        #CLK_PERIOD
            func3       = 3'b010;
        #CLK_PERIOD
            func3       = 3'b011;
        #CLK_PERIOD
            func3       = 3'b100;
        #CLK_PERIOD
            func3       = 3'b101;
        #CLK_PERIOD
            func7       = 7'b0100000;
        #CLK_PERIOD
            func3       = 3'b110;
            func7       = 7'b0000000;
        #CLK_PERIOD
            func3       = 3'b111;
        #CLK_PERIOD
            inst_type   = 4'b1111;
        #CLK_PERIOD
            $finish;
    end
endmodule
