`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2021 03:29:48 AM
// Design Name: 
// Module Name: Pipe
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


module Pipe(clk);
    input clk;
    
    wire PCSelD, Stall,RFWED,MtoRFSelD,DMWED,ALUInSelD,RFDSelD,BranchD, EqualD, RFWEW,
         Flush, RFWEE, MtoRFSelE,DMWEE,ALUInSelE,RFDSelE, RFWEM, MtoRFSelM,DMWEM,MtoRFSelW,
         ForwardAD,ForwardBD;
    wire [1:0]ForwardAE, ForwardBE;
    wire [3:0]ALUSelD,ALUSelE;
    wire [4:0]RFAW, RsD,RtD,RdD,RsE,RtE,RdE,RFAE,RFAM,shamtD,shamtE;
    wire [5:0]Op, Funct;
    wire [15:0]ImmD;
    wire [31:0]PCBranchD, PCp1F, PC, PCF, InstrF, InstrD, PCp1D, ResultW,SImmD,RFRD1D,
               RFRD2D,B1D, B2D,SImmE,RFRD1E,RFRD2E, ALUOutM, ALUIn1E, DMdinE, ALUIn2E,
               ALUOutE,DMdinM,DMOutM,DMOutW,ALUOutW, One;
    assign  One = 1;
    assign  RsD = InstrD[25:21];
    assign  RtD = InstrD[20:16];
    assign  RdD = InstrD[15:11];
    assign  shamtD = InstrD[10:6];
    assign  Op = InstrD[31:26];
    assign  Funct = InstrD[5:0];
    assign  ImmD = InstrD[15:0];
    
    MX2 MP(PCp1F, PCBranchD, PCSelD, PC);
    PC  P1(clk, Stall, PC, PCF);
    ADD PF(One, PCF, PCp1F);
    IM  I1(PCF, InstrF);
    
    FtDReg  FtD(clk, Stall, PCSelD,
                InstrF, PCp1F,
                InstrD, PCp1D);
                        
    CU  C1(Op, Funct, MtoRFSelD, DMWED, BranchD, ALUSelD, ALUInSelD, RFDSelD, RFWED);
    RF  R1(clk, RFWEW, RsD, RtD, RFAW, ResultW, RFRD1D, RFRD2D);
    SE  S1(ImmD, SImmD);
    MX2 AD(RFRD1D, ALUOutM, ForwardAD, B1D);
    MX2 BD(RFRD2D, ALUOutM, ForwardBD, B2D);
    CMP C2(B1D, B2D, EqualD);
    ADD A2(PCp1D, SImmD, PCBranchD);
    and(PCSelD, EqualD, BranchD);
    
    DtEReg  DtE(clk,Flush,
                RFWED, MtoRFSelD, DMWED, ALUSelD, ALUInSelD, RFDSelD,
                RFRD1D, RFRD2D, RsD, RtD, RdD, SImmD, shamtD,
                RFWEE, MtoRFSelE, DMWEE, ALUSelE, ALUInSelE, RFDSelE,
                RFRD1E, RFRD2E, RsE, RtE, RdE, SImmE, shamtE);
                
    MX2 RA(RtE, RdE, RFDSelE, RFAE);
    defparam RA.D_Width = 5;
    MX3 AE(RFRD1E, ResultW, ALUOutM, ForwardAE,ALUIn1E);
    MX3 BE(RFRD2E, ResultW, ALUOutM, ForwardBE, DMdinE);
    MX2 IN(DMdinE, SImmE, ALUInSelE, ALUIn2E);
    ALU AL(ALUIn1E, ALUIn2E, ALUSelE, shamtE, ALUOutE);
    
    EtMReg  EtM(clk,
                RFWEE, MtoRFSelE, DMWEE, ALUOutE, RFAE, DMdinE,
                RFWEM, MtoRFSelM, DMWEM, ALUOutM, RFAM, DMdinM);
                
    DM  D1(clk, DMWEM, ALUOutM, DMdinM, DMOutM);
    
    MtWReg  MtW(clk,
                RFWEM, MtoRFSelM, DMOutM, ALUOutM, RFAM,
                RFWEW, MtoRFSelW, DMOutW, ALUOutW, RFAW);
    
    MX2 RE(ALUOutW, DMOutW, MtoRFSelW, ResultW);
    
    HU  HZ(BranchD, MtoRFSelE,
           RFWEE, RFWEM, RFWEW,
           RsD, RtD, RsE, RtE,
           RFAE, RFAM, RFAW,
           Stall, Flush,
           ForwardAD, ForwardBD, ForwardAE, ForwardBE);             
endmodule













