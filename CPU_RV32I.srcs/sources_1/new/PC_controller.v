`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/17/2025 04:32:04 PM
// Design Name: 
// Module Name: PC_controller
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


module PC_controller(
    input               is_decode, is_branch, is_jump,
    input       [2:0]   func3,
    input       [31:0]  ALU_out,
    output reg          PC_write, PC_source
);


always @(is_decode or is_branch or is_jump or func3) begin
    PC_write    <= 1'b0;
    PC_source   <= 1'b0;

    if(is_decode) begin
        PC_write    <= 1'b1;
    end
    
    else if(is_branch) begin
        case(func3)
            3'b000 : begin
                if(ALU_out == 32'h0) begin
                    PC_write    <= 1'b1;
                    PC_source   <= 1'b1;
                end
            end
            
            3'b001 : begin
                if(ALU_out != 32'h0) begin
                    PC_write    <= 1'b1;
                    PC_source   <= 1'b1;
                end
            end
        endcase
    end
    
    else if(is_jump) begin
        PC_write    <= 1'b1;
        PC_source   <= 1'b1;
    end
end
endmodule
