`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2021 01:34:34 PM
// Design Name: 
// Module Name: CU
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


module CU(OP_Code, Funct, MtoRFSel, DMWE, Branch, ALUSel,ALUInSel, RFDSel, RFWE);
    parameter I_Width = 6;
    parameter ALU_Sel = 4;
    input [I_Width-1:0] OP_Code, Funct;
    
    output reg MtoRFSel, DMWE, Branch, ALUInSel,RFDSel,RFWE;
    output reg [ALU_Sel-1:0]ALUSel;
    
    always@(*) begin
        if(OP_Code == 0) begin
            RFDSel = 1;
            Branch = 0;
            ALUInSel = 0;
            case(Funct)
                6'b000000 : begin
                                MtoRFSel = 0;
                                DMWE = 0;
                                ALUSel = 11;
                                RFWE = 1; 
                            end
                6'b000100 : begin
                                MtoRFSel = 0;
                                DMWE = 0;
                                ALUSel = 2;
                                RFWE = 1; 
                            end
                6'b000111 : begin
                                MtoRFSel = 0;
                                DMWE = 0;
                                ALUSel = 3;
                                RFWE = 1; 
                            end
                6'b100000 : begin
                                MtoRFSel = 0;
                                DMWE = 0;
                                ALUSel = 0;
                                RFWE = 1;
                            end
                6'b100010 : begin
                                MtoRFSel = 0;
                                DMWE = 0;
                                ALUSel = 1;
                                RFWE = 1;
                            end
            endcase
        end else begin
            RFDSel = 0;
            case(OP_Code)
                6'b000010 : begin
                                MtoRFSel = 0;
                                DMWE = 0;
                                Branch = 0;
                                ALUSel = 0;
                                ALUInSel = 0;
                                RFWE = 0;
                            end
                6'b000100 : begin
                                MtoRFSel = 0;
                                DMWE = 0;
                                Branch = 1;
                                ALUSel = 1;
                                ALUInSel = 0;
                                RFWE = 0;
                            end
                6'b001000 : begin
                                MtoRFSel = 0;
                                DMWE = 0;
                                Branch = 0;
                                ALUSel = 0;
                                ALUInSel = 1;
                                RFWE = 1;
                            end
                6'b100011 : begin
                                MtoRFSel = 1;
                                DMWE = 0;
                                Branch = 0;
                                ALUSel = 10;
                                ALUInSel = 1;
                                RFWE = 1;
                            end
                6'b101011 : begin
                                MtoRFSel = 1;
                                DMWE = 1;
                                Branch = 0;
                                ALUSel = 10;
                                ALUInSel = 1;
                                RFWE = 0;
                            end
            endcase
        end
    end
endmodule
