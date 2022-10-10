module EtMReg  (clk,
                RFWEE, MtoRFSelE, DMWEE, ALUOutE, RFAE, DMdinE,
                RFWEM, MtoRFSelM, DMWEM, ALUOutM, RFAM, DMdinM);
    
    input   clk, RFWEE, MtoRFSelE, DMWEE;
    input   [4:0]RFAE;
    input   [31:0]ALUOutE, DMdinE;
    output  reg RFWEM, MtoRFSelM, DMWEM;
    output  reg [4:0]RFAM;
    output  reg [31:0]ALUOutM, DMdinM;
    
    initial begin
        RFWEM = 0;
        MtoRFSelM = 0;
        DMWEM = 0;
        RFAM = 0;
        ALUOutM = 0;
        DMdinM = 0;
    end
    always@(posedge clk) begin
        RFWEM = RFWEE;
        MtoRFSelM = MtoRFSelE;
        DMWEM = DMWEE;
        RFAM = RFAE;
        ALUOutM = ALUOutE;
        DMdinM = DMdinE;
    end
endmodule