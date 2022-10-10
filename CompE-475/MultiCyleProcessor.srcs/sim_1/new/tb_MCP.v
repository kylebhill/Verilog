`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2021 07:58:03 PM
// Design Name: 
// Module Name: tb_MCP
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


module tb_MCP;
    reg clk;
    
    MCP P1(clk);
    always #1 clk = ~clk;
    
    initial begin
        clk = 0;
    #1000 $finish;
    end
endmodule
