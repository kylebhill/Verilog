`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/09/2021 08:52:50 PM
// Design Name: 
// Module Name: Register File
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


module RF(clk, RFWE, RFR1, RFR2, RFWA, RFWD, RFRD1, RFRD2);

    parameter D_Width = 32;
    parameter D_Depth = 32;
    parameter A_Width = $clog2(D_Depth);
    
    input   clk, RFWE;
    input   [D_Width-1:0]RFWD;
    input   [A_Width-1:0] RFR1,RFR2,RFWA;
    
    output  [D_Width-1:0] RFRD1, RFRD2;
    
    reg [D_Width-1:0] Memory [D_Depth-1:0];
    
    initial begin
    $readmemb("RF.dat", Memory);
    end
    
    always@(posedge clk) begin
        if(RFWE)begin
            Memory[RFWA] = RFWD;
        end
    end
    
    assign RFRD1 = ((RFWA == RFR1) && (RFWE==1))? RFWD : Memory[RFR1];
    assign RFRD2 = ((RFWA == RFR2) && (RFWE==1))? RFWD : Memory[RFR2];
    
endmodule
