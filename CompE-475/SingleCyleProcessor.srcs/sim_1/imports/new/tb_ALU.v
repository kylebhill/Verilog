`timescale 1ns / 1ps

module tb_ALU;
    parameter Width = 32;
    reg   signed [Width-1:0] ALUIn1, ALUIn2;
    reg   [3:0] ALUsel;
    wire  signed [Width:0]ALUout;
    wire  zero;
    
    ALU A1(ALUIn1, ALUIn2, ALUsel, ALUout, zero);
    
    always #2 ALUsel = ALUsel + 1;
    
    initial begin
        ALUIn1 = 1; ALUIn2 = 1; ALUsel = 0;
    #19 $finish;
    end
endmodule 