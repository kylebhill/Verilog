`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2021 03:59:32 PM
// Design Name: 
// Module Name: ADD
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


module ADD(N1,N2,Sum);
    parameter D_Width = 32;
    input   signed [D_Width-1:0] N1, N2;
    output  signed [D_Width-1:0]Sum;
    
    assign Sum = N1+N2;
endmodule
