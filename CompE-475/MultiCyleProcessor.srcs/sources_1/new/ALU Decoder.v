`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2021 03:35:39 PM
// Design Name: 
// Module Name: ALUD
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


module ALUD(Funct, ALUOp, 
            ALUSel);
    input       [1:0]ALUOp;
    input       [5:0]Funct;
    output reg  [3:0]ALUSel;
    always@(*) begin
        if (ALUOp == 0) begin
            ALUSel = 0;
        end else if(ALUOp == 1) begin
            ALUSel = 1;
        end else if(ALUOp == 3) begin
            ALUSel = 10;
        end else begin
            case(Funct)
                6'b000000 : begin
                                ALUSel = 11;
                            end
                6'b000100 : begin
                                ALUSel = 2;
                            end
                6'b000111 : begin
                                ALUSel = 3;
                            end
                6'b100000 : begin
                                ALUSel = 0;
                            end
                6'b100010 : begin
                                ALUSel = 1;
                            end
            endcase
        end
    end  
endmodule
