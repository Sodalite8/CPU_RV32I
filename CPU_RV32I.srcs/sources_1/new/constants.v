`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2025 06:01:25 PM
// Design Name: 
// Module Name: constants
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


`ifndef __CONSTANTS__
`define __CONSTANTS__


`define ERROR       3'b000
`define FETCH       3'b001
`define DECODE      3'b010
`define EXECUTE     3'b011
`define MEM_ACCESS  3'b100
`define WRITEBACK   3'b101


`define OP_R_TYPE       7'b0110011
`define OP_I_TYPE_CALC  7'b0010011
`define OP_I_TYPE_JALR  7'b1100111
`define OP_I_TYPE_LOAD  7'b0000011
`define OP_S_TYPE       7'b0100011
`define OP_B_TYPE       7'b1100011
`define OP_U_TYPE_LUI   7'b0110111
`define OP_U_TYPE_AUIPC 7'b0010111
`define OP_J_TYPE       7'b1101111


`define INST_NOP    4'b0000
`define INST_R_CALC 4'b0001
`define INST_I_CALC 4'b0010
`define INST_LOAD   4'b0011
`define INST_STORE  4'b0100
`define INST_BRANCH 4'b0101
`define INST_LUI    4'b0110
`define INST_AUIPC  4'b0111
`define INST_JALR   4'b1000
`define INST_JAL    4'b1001


`define ALU_NOP     4'b0000
`define ALU_ADD     4'b0001
`define ALU_SUB     4'b0010
`define ALU_SLT     4'b0011
`define ALU_SLTU    4'b0100
`define ALU_SLL     4'b0101
`define ALU_SRL     4'b0110
`define ALU_SRA     4'b0111
`define ALU_AND     4'b1000
`define ALU_OR      4'b1001
`define ALU_XOR     4'b1010


`endif
