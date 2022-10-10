`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2021 01:45:05 AM
// Design Name: 
// Module Name: FtDReg
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


module FtDReg(  clk, Stall, PCSelID,
                InstrF, PCp1F,
                InstrD, PCp1D);
    input   clk, Stall, PCSelID;
    input   [31:0]InstrF, PCp1F;
    
    output  reg [31:0]InstrD, PCp1D;
    
    initial begin
    InstrD = 0;
    PCp1D = 0;
    end
    
    always@(posedge clk)begin
        if(PCSelID) begin
            InstrD = 0;
            PCp1D = 0;
        end
        else if(!Stall) begin
            InstrD = InstrF;
            PCp1D = PCp1F;
        end
    end
endmodule
