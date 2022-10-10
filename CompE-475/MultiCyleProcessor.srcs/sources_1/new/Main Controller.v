`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2021 03:35:39 PM
// Design Name: 
// Module Name: MC
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


module MC(  clk, OpCode, 
            MtoRFSel, RFDSel, IDSel, PCSel, ALUIn2Sel, ALUIn1Sel, ALUOp,
            IRWE, MWE, PCWE, Branch, RFWE);
    
    parameter   Op_Width = 6;
    
    input       clk;
    input       [Op_Width-1:0] OpCode;
    
    output reg  MtoRFSel, RFDSel, IDSel, ALUIn1Sel;
    output reg  [1:0]ALUIn2Sel, PCSel, ALUOp;
    output reg  IRWE, MWE, PCWE, Branch, RFWE;
    
    reg         [3:0]State, NState;
    
    initial begin
        State = 0;
        IDSel = 0;
    end
    always@(posedge clk) begin
        IRWE = 0; MWE = 0; PCWE = 0; Branch = 0; RFWE = 0;
        case(State)   
            4'b0000 : begin
                          IDSel = 0; ALUIn1Sel = 0; ALUIn2Sel = 1; ALUOp = 0; PCSel = 0; 
                          PCWE = 1; IRWE = 1;
                          NState = 12;
                      end
            4'b0001 : begin
                          ALUIn1Sel = 0; ALUIn2Sel = 2; ALUOp = 0;
                          PCWE = 0;
                          case(OpCode)
                            6'b100011 : NState = 2;
                            6'b101011 : NState = 2;
                            6'b000000 : NState = 6;
                            6'b000100 : NState = 8;
                            6'b000010 : NState = 9;
                            6'b001000 : NState = 10;
                          endcase
                      end
            4'b0010 : begin
                          ALUIn1Sel = 1; ALUIn2Sel = 2; ALUOp = 3;
                          if(OpCode == 35) NState = 3;
                          else NState = 5;
                      end
            4'b0011 : begin
                          IDSel = 1;
                          NState = 4;
                          NState = 4;
                      end
            4'b0100 : begin
                          RFDSel = 0; MtoRFSel = 1;
                          RFWE = 1;
                          NState = 13;
                      end
            4'b0101 : begin
                          IDSel = 1;
                          MWE = 1;
                          NState = 13;
                      end
            4'b0110 : begin
                          ALUIn1Sel = 1; ALUIn2Sel = 0; ALUOp = 2;
                          NState = 7;
                      end
            4'b0111 : begin
                          RFDSel = 1; MtoRFSel = 0;
                          RFWE = 1;
                          NState = 13;
                      end
            4'b1000 : begin
                          ALUIn1Sel = 1; ALUIn2Sel = 0; ALUOp = 1; PCSel = 1;
                          Branch = 1;
                          NState = 13;
                      end
            4'b1001 : begin
                          PCSel = 2;
                          PCWE = 1;
                          NState = 13;
                      end
            4'b1010 : begin
                          ALUIn1Sel = 1; ALUIn2Sel = 2; ALUOp = 0;
                          NState = 11;
                      end
            4'b1011 : begin
                          RFDSel = 0; MtoRFSel = 0;
                          RFWE = 1;
                          NState = 13;
                      end
            4'b1100 : begin
                          IDSel = 0;
                          NState = 1;
                      end
            4'b1101 : begin
                          IDSel = 0;
                          NState = 0;
                      end
        endcase
        State = NState;
    end
endmodule


