`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/09/2021 04:55:03 PM
// Design Name: 
// Module Name: Instruction Memory
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


module IM(IMA, IMD);

    parameter   D_Width = 32,
                Mem_Width = 32,
                Mem_Depth = 16;
    
    input   [D_Width-1:0]IMA;
    
    output  [D_Width-1:0]IMD;
    
    reg [D_Width-1:0] Memory [Mem_Depth-1:0];
    
    assign IMD = Memory[IMA];
    
    initial begin
    $readmemh("IMc.dat", Memory);
    end
endmodule
