
module TP_ROW(
    input [31:0] X_ROW,
    input [31:0] PI_ROW,
    input CI_ROW,
    input Y_ROW,
    output CO_ROW,
    output [31:0] PO_ROW
    );
    
    wire [32:0] C;
    assign C[0]=CI_ROW;
    
    generate
        genvar i;
        for(i=0; i<32; i=i+1)
            begin: struct_TP
            TP Uy(.X(X_ROW[i]), .Y(Y_ROW), .PI(PI_ROW[i]), .CI(C[i]), .CO(C[i+1]), .PO(PO_ROW[i]));
        end
        
    endgenerate
    
    assign CO_ROW=C[32];
    
endmodule
