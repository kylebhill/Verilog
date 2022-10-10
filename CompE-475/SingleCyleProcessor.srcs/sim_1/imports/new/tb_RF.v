module tb_RF;

    parameter D_Width = 32;
    parameter D_Depth = 32;
    parameter A_Width = $clog2(D_Depth);
    
    reg   clk, RFWE;
    reg   [D_Width-1:0]RFWD;
    reg   [A_Width-1:0] RFR1,RFR2,RFWA;
    
    wire  [D_Width-1:0] RFRD1, RFRD2;
    
    RF R1(clk, RFWE, RFR1, RFR2, RFWA, RFWD, RFRD1, RFRD2);
    
    always #1 clk = ~clk;
    
    initial begin
        clk = 0; RFWE = 0; RFR1 = 0; RFR2 = 1; RFWA = 0; RFWD = 15;
    #2  RFWE = 1;
    #2  RFR1 = 2;
    #2  $finish;
    end
endmodule