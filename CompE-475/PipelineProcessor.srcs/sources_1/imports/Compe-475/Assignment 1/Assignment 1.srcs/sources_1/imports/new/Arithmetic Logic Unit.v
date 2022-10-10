`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/09/2021 07:29:54 PM
// Design Name: 
// Module Name: ALU
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


module ALU(ALUIn1, ALUIn2, ALUsel,shamt, ALUout);
    parameter   D_Width = 32,
                ALU_Sel = 4;
    input   signed [D_Width-1:0] ALUIn1, ALUIn2;
    input   [(D_Width/8):0]shamt;
    input   [ALU_Sel-1:0] ALUsel;
    output  reg signed [D_Width:0]ALUout;
    
    always@(*) begin
        case(ALUsel)
            4'b0000 : ALUout = ALUIn1 +   ALUIn2;
            4'b0001 : ALUout = ALUIn1 -   ALUIn2;
            4'b0010 : ALUout = ALUIn2 <<  ALUIn1;
            4'b0011 : ALUout = ALUIn2 >>  ALUIn1;
            4'b0100 : ALUout = ALUIn1 <<< ALUIn2;
            4'b0101 : ALUout = ALUIn1 >>> ALUIn2;
            4'b0110 : ALUout = ALUIn1 &   ALUIn2;
            4'b0111 : ALUout = ALUIn1 |   ALUIn2;
            4'b1000 : ALUout = ALUIn1 ^   ALUIn2;
            4'b1001 : begin
                            if(ALUIn1^ALUIn2) ALUout = 0;
                            else ALUout = 1;
                        end
            4'b1010 : ALUout = ALUIn1 + (ALUIn2>>>2);
            4'b1011 : ALUout = ALUIn2 << shamt;
            4'b1111 : ALUout = 0;
        endcase
    end   
endmodule
