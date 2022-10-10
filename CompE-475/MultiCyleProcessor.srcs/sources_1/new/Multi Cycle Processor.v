`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2021 04:19:03 PM
// Design Name: 
// Module Name: MCP
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


module MCP(clk);
    input clk;
    
    parameter D_Width = 32;
    
    wire    IRWE, MWE, PCWE, Branch, RFWE,
            MtoRFSel, RFDSel, IDSel, ALUIn1Sel,
            zero,BRE,PCE;
    
    wire    [1:0]ALUOp, ALUIn2Sel, PCSel;
    wire    [3:0]ALUSel;
    wire    [4:0]rs, rt, rd, rtd, shamt;
    wire    [5:0]OpCode,Funct;
    wire    [15:0]Imm;
            
    wire    [D_Width-1:0]Adr, MRD, IR, DR,
            RFRD1, RFRD2, RFWD,
            PCR, A, ALUIn1,
            B, One, SImm, ALUIn2,
            ALUOut, ALUOutR,
            Jaddr, PC;
            
    assign  One = 1;
    assign  rs = IR[25:21];
    assign  rt = IR[20:16];
    assign  rd = IR[15:11];
    assign  shamt = IR[10:6];
    assign  OpCode = IR[31:26];
    assign  Funct = IR[5:0];
    assign  Imm = IR[15:0];
    assign  Jaddr = ({PCR[31:26],IR[25:0]}+750);
    and(BRE, zero, Branch);
    or(PCE, PCWE, BRE);
    
    MC MC1  (clk, OpCode, MtoRFSel, RFDSel, IDSel, PCSel, ALUIn2Sel, ALUIn1Sel, ALUOp, IRWE, MWE, PCWE, Branch, RFWE);
    
    P PC1   (clk, PCE, PC, PCR);
    IE IR1  (clk, IRWE, MRD, IR);
    IS DR1  (clk, MRD, DR);
    IS ALUR1(clk, ALUOut, ALUOutR);
    RIR RIR1(clk, RFRD1, RFRD2, A, B);
    
    M2 ID   (IDSel, PCR, ALUOutR, Adr);
    M2 RFWD1(MtoRFSel, ALUOutR, DR, RFWD);
    M2 ALUI1(ALUIn1Sel, PCR, A, ALUIn1);
    M2 RFD  (RFDSel, rt, rd, rtd);
    defparam RFD.D_Width = 5;
    
    M3 ALUI2(ALUIn2Sel, B, One, SImm, ALUIn2);
    M3 PCIN (PCSel, ALUOut, ALUOutR, Jaddr, PC);
    
    SE S1   (Imm,SImm);
    
    Mem M   (clk, MWE, Adr, B, MRD);
    RF  R   (clk, RFWE, rs, rt, rtd, RFWD, RFRD1, RFRD2);
    ALU ALU1(ALUSel, ALUIn1, ALUIn2, shamt, ALUOut, zero);
    ALUD ALD(Funct, ALUOp, ALUSel);
    
endmodule
