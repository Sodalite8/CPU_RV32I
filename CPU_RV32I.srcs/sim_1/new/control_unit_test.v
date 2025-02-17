`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2025 10:52:26 PM
// Design Name: 
// Module Name: control_unit_test
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


module control_unit_test();
    reg             CLK, RES;
    reg     [6:0]   opcode;
    wire            inst_write;
    wire    [3:0]   inst_type;
    wire            reg_write;
    wire            ALU_source1;
    wire    [1:0]   ALU_source2;
    wire            PC_adder_source1;
    wire            inst_or_data, mem_read, mem_write, ALU_or_mem;
    wire            is_decode, is_branch, is_jump;
    
    parameter       CLK_PERIOD = 10;


    control_unit control_unit(
        .CLK(CLK),
        .RES(RES),
        .opcode(opcode),
        .inst_write(inst_write),
        .inst_type(inst_type),
        .reg_write(reg_write),
        .ALU_source1(ALU_source1),
        .ALU_source2(ALU_source2),
        .PC_adder_source1(PC_adder_source1),
        .inst_or_data(inst_or_data),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .ALU_or_mem(ALU_or_mem),
        .is_decode(is_decode),
        .is_branch(is_branch),
        .is_jump(is_jump)
    );
    
    
    initial begin
        CLK = 1'b1;
    end
    
    always begin
        #(CLK_PERIOD / 2)
            CLK = ~CLK;
    end
    
    initial begin
            RES = 1'b1;
            opcode = 7'b0000000;
        #CLK_PERIOD
            RES = 1'b0;
            opcode = 7'b0110011;
        #CLK_PERIOD
            RES = 1'b1;
        #(CLK_PERIOD * 3)
            opcode = 7'b0010011;
        #(CLK_PERIOD * 4)
            opcode = 7'b1100111;
        #(CLK_PERIOD * 4)
            opcode = 7'b1101111;
        #(CLK_PERIOD * 4)
            opcode = 7'b0000011;
        #(CLK_PERIOD * 5)
            opcode = 7'b0100011;
        #(CLK_PERIOD * 4)
            opcode = 7'b1100011;
        #(CLK_PERIOD * 3)
            opcode = 7'b0110111;
        #(CLK_PERIOD * 4)
            opcode = 7'b0010111;
        #(CLK_PERIOD * 4)
            $finish;
    end
endmodule
