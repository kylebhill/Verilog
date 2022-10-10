`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2021 03:35:39 PM
// Design Name: 
// Module Name: Mem
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


module Mem( clk, MWE, MRA, MWD, MRD);
    parameter   D_Width = 32,
                Mem_Width = 32,
                Mem_Depth = 1500;
    
    input       clk, MWE;
    input       [Mem_Width-1:0]MRA;
    input       [D_Width-1:0]MWD;
    
    output      [D_Width-1:0]MRD;
    
    reg [D_Width-1:0] Memory [Mem_Depth-1:0];
    
    assign MRD = Memory[MRA];
    
    initial begin
    $readmemh("IMe.dat", Memory, 750);
    $readmemb("DM.dat", Memory, 0);
    end
    
    always@(posedge clk) begin
        if(MWE) begin
            Memory[MRA] = MWD;
        end
    end
endmodule
