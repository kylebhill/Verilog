module DtEReg  (clk,Flush,
                RFWED, MtoRFSelD, DMWED, ALUSelD, ALUInSelD, RFDSelD,
                RFRD1D, RFRD2D, RsD, RtD, RdD, SImmD, shamtD,
                RFWEE, MtoRFSelE, DMWEE, ALUSelE, ALUInSelE, RFDSelE,
                RFRD1E, RFRD2E, RsE, RtE, RdE, SImmE, shamtE);
                
    input   clk, Flush, RFWED, MtoRFSelD, DMWED, ALUInSelD, RFDSelD;
    input   [3:0]ALUSelD;
    input   [4:0]RsD, RtD, RdD, shamtD;
    input   [31:0]RFRD1D, RFRD2D, SImmD;
    output  reg RFWEE, MtoRFSelE, DMWEE, ALUInSelE, RFDSelE;
    output  reg [3:0]ALUSelE;
    output  reg [4:0]RsE, RtE, RdE;
    output  reg [31:0]RFRD1E, RFRD2E, SImmE, shamtE;
    
    initial begin
        RFWEE = 0;
        MtoRFSelE = 0;
        DMWEE = 0;
        ALUSelE = 0;
        ALUInSelE = 0;     
        RFDSelE = 0;
        RFRD1E = 0;
        RFRD2E = 0;
        RsE = 0;
        RtE = 0;
        RdE = 0;
        SImmE = 0; 
        shamtE = 0;
    end
    always@(posedge clk) begin
        if(Flush) begin
            RFWEE = 0;
            MtoRFSelE = 0;
            DMWEE = 0;
            ALUSelE = 0;
            ALUInSelE = 0;     
            RFDSelE = 0;
            RFRD1E = 0;
            RFRD2E = 0;
            RsE = 0;
            RtE = 0;
            RdE = 0;
            SImmE = 0;
            shamtE = 0;
        end else begin
            RFWEE = RFWED;
            MtoRFSelE = MtoRFSelD;
            DMWEE = DMWED;
            ALUSelE = ALUSelD;
            ALUInSelE = ALUInSelD;
            RFDSelE = RFDSelD;
            RFRD1E = RFRD1D;
            RFRD2E = RFRD2D;
            RsE = RsD;
            RtE = RtD;
            RdE = RdD;
            SImmE = SImmD;
            shamtE = shamtD;
        end 
    end
endmodule