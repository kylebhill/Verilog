module DM(clk, DMWE, DMA, DMWD, DMRD);

    parameter   D_Width = 32,
                Mem_Width = 32,
                Mem_Depth = 2000;
    
    input   clk, DMWE;
    input   [Mem_Width-1:0]DMA;
    input   [D_Width-1:0]DMWD;
    
    output  [D_Width-1:0]DMRD;
    
    reg [D_Width-1:0] Memory [Mem_Depth-1:0];
    
    assign DMRD = Memory[DMA];
    
    initial begin
    $readmemb("DM.dat", Memory);
    end
    
    always@(posedge clk) begin
        if(DMWE) begin
            Memory[DMA] = DMWD;
        end
    end
endmodule