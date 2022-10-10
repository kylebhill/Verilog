`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2021 07:54:20 PM
// Design Name: 
// Module Name: SCPa
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


module tb_Pipe;
    reg clk;
    
    Pipe P1(clk);
    always #2 clk = ~clk;
    
    initial begin
        clk = 0;
    #350 $finish;
    end
endmodule
