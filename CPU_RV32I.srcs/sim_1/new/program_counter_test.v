`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2025 02:45:29 PM
// Design Name: 
// Module Name: program_counter_test
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


module program_counter_test();
    reg             CLK, RES;
    reg             write;
    reg     [31:0]  PC_next;
    wire    [31:0]  PC;
    
    parameter       CLK_PERIOD = 100;
    
    
    program_counter program_counter(
        .CLK(CLK),
        .RES(RES),
        .PC_next(PC_next),
        .write(write),
        .PC(PC)
    );
    
    
    initial begin
        CLK = 1'b1;
        RES = 1'b1;
        write = 1'b0;
        PC_next = 32'h4;
    end
    
    always begin
        #(CLK_PERIOD / 2)
            CLK = ~CLK;
    end
    
    always begin
        #CLK_PERIOD
            RES = 1'b0;
        #CLK_PERIOD
            RES = 1'b1;
        #(CLK_PERIOD * 2)
            write = 1'b1;
        #CLK_PERIOD
            write = 1'b0;
            PC_next = 32'h8;
        #(CLK_PERIOD * 4)
            $finish;       
    end
endmodule
