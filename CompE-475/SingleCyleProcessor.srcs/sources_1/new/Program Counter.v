`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2021 11:18:59 AM
// Design Name: 
// Module Name: PC
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


module PC(clk, PC_In, PC_Out);
    input clk;
    parameter D_Width = 32;
    input [D_Width-1:0]PC_In;
    output reg [D_Width-1:0]PC_Out;
    
    initial PC_Out = 0;
    always@(posedge clk) begin
        PC_Out = PC_In;
    end
endmodule
