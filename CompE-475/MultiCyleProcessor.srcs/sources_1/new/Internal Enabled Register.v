`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2021 11:33:29 PM
// Design Name: 
// Module Name: IER
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


module IE(clk, en, in, out);
    input [31:0]in;
    input clk, en;
    
    output reg [31:0]out;
    
    always@(posedge clk) begin
        if(en) out = in;
    end
    
endmodule
