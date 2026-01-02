
module MULL(
    input [31:0] X,
    input [31:0] Y,
    output [63:0] P
    );
    
    wire [31:0] tmp_and;
    wire [31:0] tmp_PO [31:0];
    wire [31:0] tmp_CO;
    
    
    AND32 U0(.Y0(Y[0]), .X(X), .Z(tmp_and));
    assign tmp_CO[0]=1'b0;
    assign tmp_PO[0]=tmp_and;
    
    generate
    genvar i;
        for(i=1; i<32; i=i+1)
        begin: struct_MULL
            TP_ROW Uz(.X_ROW(X), .Y_ROW(Y[i]), .CI_ROW(1'b0), .CO_ROW(tmp_CO[i]),
            .PI_ROW({tmp_CO[i-1],tmp_PO[i-1][31:1]}), .PO_ROW(tmp_PO[i]));
        end    
    endgenerate
    
    assign P={tmp_CO[31], tmp_PO[31], tmp_PO[30][0], tmp_PO[29][0], tmp_PO[28][0], tmp_PO[27][0], tmp_PO[26][0],
    tmp_PO[25][0], tmp_PO[24][0], tmp_PO[23][0], tmp_PO[22][0], tmp_PO[21][0], tmp_PO[20][0], tmp_PO[19][0], tmp_PO[18][0], tmp_PO[17][0], tmp_PO[16][0],
    tmp_PO[15][0], tmp_PO[14][0], tmp_PO[13][0], tmp_PO[12][0], tmp_PO[11][0], tmp_PO[10][0], tmp_PO[9][0], tmp_PO[8][0], tmp_PO[7][0], tmp_PO[6][0],
    tmp_PO[5][0], tmp_PO[4][0], tmp_PO[3][0], tmp_PO[2][0], tmp_PO[1][0], tmp_and[0]};
    
endmodule
