
module ALU_TOP(
    input [31:0] A,
    input [31:0] B,
    input [5:0] opUAL,
    output [31:0] Rez,
    output CO,
    output OV,
    output Z
    );
    
    wire [31:0] tmp_ALU32, tmp_MULL, tmp_XOR, tmp_shift_l;
    wire [63:0] tmp_MULL64;
    
    assign tmp_MULL=tmp_MULL64[31:0];
    assign tmp_XOR=A^B;
    assign tmp_shift_l={A[29:0],2'b0};
    
    UAL32 U0(.A(A), .B(B), .opUAL(opUAL[3:0]), .F(tmp_ALU32), .CO(CO), .OV(OV), .Z(Z));
    
    MULL U1(.X(A), .Y(B), .P(tmp_MULL64));
    
    mux4_32b U2(.din0(tmp_ALU32), .din1(tmp_MULL), .din2(tmp_XOR),
            .din3(tmp_shift_l), .sel(opUAL[5:4]), .dout(Rez));
    
endmodule
