`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2021 01:44:50 PM
// Design Name: 
// Module Name: SCP
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


module SCP(clk);
    input clk;
    
    parameter   D_Width = 32,
                ALU_Sel = 4;
                
    reg         [D_Width-1:0]N1 = 1;
    
    wire    [D_Width-1:0]PC_Out,    //Program Counter
            PCp1,                   //Program Counter plus 1
            IMD, DMRD,              //Memory Read Data
            SImm,                   //Extended Immediate Value
            ALUout,                 //Ouput ALU
            RFRD1,RFRD2,
            ALUIn2,
            RFWD,
            PCNext,
            PCBranch,
            PCFinal;
            
    wire    [5:0]OP_Code;
            assign OP_Code = IMD[31:26];
            
    wire    [ALU_Sel-1:0]ALUSel;
    
    wire    [4:0]RFWA;
            
    wire    MtoRFSel,               //For Mux ALU vs DM
            DMWE,                   //Data Write Enable
            Branch,                 //Branching
            ALUInSel,               //ALU In Mux
            RFDSel,                 //For Mux rtd
            RFWE,                   //Register Write Enable
            zero,                   //Zero flag
            PCSel,
            Jump;
     
    PC  P1(clk, PCFinal, PC_Out);
    IM  I1(PC_Out, IMD);
    CU  C1(IMD[31:26],IMD[5:0],MtoRFSel, DMWE, Branch, ALUSel, ALUInSel, RFDSel, RFWE, Jump);
    RF  R1(clk, RFWE, IMD[25:21], IMD[20:16],RFWA, RFWD, RFRD1, RFRD2);
    ALU AL(RFRD1, ALUIn2, ALUSel,IMD[10:6], ALUout, zero);
    DM  D1(clk, DMWE, ALUout, RFRD2, DMRD);
    
    SE  S1(IMD[15:0],SImm);
    ADD A1(N1, PC_Out, PCp1);
    ADD A2(SImm,PCp1, PCBranch);
    Mux Mto(ALUout, DMRD, MtoRFSel, RFWD);
    Mux Ain(RFRD2, SImm, ALUInSel, ALUIn2);
    
    Mux J1(PCNext, {PC_Out[31:26],IMD[25:0]}, Jump, PCFinal);
    
    and(PCSel, Branch, zero);
    Mux PCN(PCp1, PCBranch, PCSel, PCNext);
    
    Mux Rdt(IMD[20:16], IMD[15:11], RFDSel, RFWA);
    defparam Rdt.D_Width = 5;
endmodule
