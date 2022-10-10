module MtWReg  (clk,
                RFWEM, MtoRFSelM, DMOutM, ALUOutM, RFAM,
                RFWEW, MtoRFSelW, DMOutW, ALUOutW, RFAW);
    input   clk, RFWEM, MtoRFSelM;
    input   [4:0]RFAM;
    input   [31:0]DMOutM,ALUOutM;
    output  reg RFWEW, MtoRFSelW;
    output  reg [4:0]RFAW;
    output  reg [31:0]DMOutW,ALUOutW;
    
    initial begin
        RFWEW = 0;
        MtoRFSelW = 0;
        RFAW = 0;
        DMOutW= 0;
        ALUOutW = 0;
    end
    always@(posedge clk) begin
        RFWEW = RFWEM;
        MtoRFSelW = MtoRFSelM;
        RFAW = RFAM;
        DMOutW= DMOutM;
        ALUOutW = ALUOutM;
    end
endmodule