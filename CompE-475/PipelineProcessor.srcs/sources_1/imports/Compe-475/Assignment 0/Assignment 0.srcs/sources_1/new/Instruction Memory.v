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

    parameter D_Width = 32;
    parameter D_Depth = 200;
    parameter A_Width = $clog2(D_Depth);
    
    input   [A_Width-1:0]IMA;
    
    output  [D_Width-1:0]IMD;
    
    reg [D_Width-1:0] Memory [D_Depth-1:0];
    
    assign IMD = Memory[IMA];
    
    initial begin
    $readmemh("IMe2.dat", Memory);
    end
endmodule
