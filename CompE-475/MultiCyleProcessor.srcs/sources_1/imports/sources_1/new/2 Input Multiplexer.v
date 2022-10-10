module M2(Sel,In0,In1,Out);
    parameter D_Width = 32;
    input Sel;
    input [D_Width-1:0] In0, In1;
    output reg [D_Width-1:0]Out;
    
    always@(*)begin
        case(Sel)
            1'b0: Out = In0;
            1'b1: Out = In1;
        endcase
    end
endmodule