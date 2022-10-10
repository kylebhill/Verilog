`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2021 01:45:43 AM
// Design Name: 
// Module Name: HU
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


module HU(  BranchD, MtoRFSelE,
            RFWEE, RFWEM, RFWEW,
            RsD, RtD, RsE, RtE,
            RFAE, RFAM, RFAW,
            Stall, Flush,
            ForwardAD, ForwardBD, ForwardAE, ForwardBE);
            
    input   BranchD, MtoRFSelE, RFWEE, RFWEM, RFWEW;
    input   [4:0] RsD, RtD, RsE, RtE, RFAE, RFAM, RFAW;
    
    output  Stall, Flush, ForwardAD, ForwardBD;
    output  reg [1:0]ForwardAE, ForwardBE; 
    
    wire LWStall = MtoRFSelE && ((RtE == RsD) || (RtE == RtD));
    wire BRStall =    (RsD == RFAE || RtD == RFAE) && BranchD && RFWEE 
                   || (RsD == RFAM || RtD == RFAM) && BranchD && MtoRFSelE;
    assign Stall = LWStall || BRStall;
    assign Flush = LWStall || BRStall;
    
    assign ForwardAD = ((RsD != 0) && (RsD == RFAM) && RFWEM);
    assign ForwardBD = ((RtD != 0) && (RtD == RFAM) && RFWEM);
    initial begin
        ForwardAE = 00;
        ForwardBE = 00;
    end
    always@(*) begin
        if      ((RsE != 0) && RFWEM && (RsE == RFAM)) begin
                ForwardAE = 2'b10;
        end
        else if ((RsE != 0) && RFWEW && (RsE == RFAW)) begin 
                ForwardAE = 2'b01;
        end
        else    begin
                ForwardAE = 00;
        end
        if      ((RtE != 0) && RFWEM && (RtE == RFAM)) begin
                ForwardBE = 2'b10;
        end
        else if ((RtE != 0) && RFWEW && (RtE == RFAW)) begin
                ForwardBE = 2'b01;
        end
        else    begin
                ForwardBE = 00;
        end
    end
endmodule
