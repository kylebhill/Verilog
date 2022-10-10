`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2021 03:49:30 PM
// Design Name: 
// Module Name: Mux3
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


module MX3(In0, In1, In2, Sel, Out);
    parameter D_Width = 32;
    input [1:0]Sel;
    input [D_Width-1:0] In0, In1, In2;
    output reg [D_Width-1:0]Out;
    always@(*)begin
        case(Sel)
            2'b00: Out = In0;
            2'b01: Out = In1;
            2'b10: Out = In2;
        endcase
    end
endmodule
