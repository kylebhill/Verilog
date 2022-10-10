module tb_DM;
    
    parameter D_Width = 32;
    parameter D_Depth = 5;
    parameter A_Width = 32;
    
    reg   clk, DMWE;
    reg   [A_Width-1:0]DMA;
    reg   [D_Width-1:0]DMWD;
    
    wire  [D_Width-1:0]DMRD;
    
    DM D1(clk, DMWE, DMA, DMWD, DMRD);
    
    always #1 clk = ~clk;
    
    initial begin
        clk = 0; DMA = 1; DMWD = 32; DMWE = 0;
    #2  DMA = 2;
    #2  DMWE = 1;
    #2  DMA = 0;
    #1  $finish;
    end
endmodule