`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2021 06:12:08 PM
// Design Name: 
// Module Name: SE
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


module SE(Imm, SImm);
    parameter   D_Input = 16,
                D_Width = 32;
    input [D_Input-1:0]Imm;
    output[D_Width-1:0]SImm;
    
    assign SImm = {{(D_Width-D_Input){Imm[D_Input-1]}}, Imm[D_Input-1:0]};
endmodule
