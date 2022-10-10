`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2021 09:24:19 PM
// Design Name: 
// Module Name: Internal Register
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


module IS(clk, in, out);
    input [31:0]in;
    input clk;
    output reg [31:0]out;
    
    always@(posedge clk) out = in;
    
endmodule
