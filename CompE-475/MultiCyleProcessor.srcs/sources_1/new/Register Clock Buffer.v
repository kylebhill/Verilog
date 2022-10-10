`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2021 04:03:34 PM
// Design Name: 
// Module Name: RCB
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


module RIR(clk, in1, in2, RFD1, RFD2);
    input       clk;
    parameter   D_Width = 32;
    input       [D_Width-1:0]in1, in2;
    output reg  [D_Width-1:0]RFD1, RFD2;
    always@(posedge clk) begin
        RFD1 = in1;
        RFD2 = in2;
    end
endmodule
