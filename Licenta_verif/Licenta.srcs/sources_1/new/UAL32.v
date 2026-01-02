module UAL32(
    input [31:0] A,
    input [31:0] B,
    input [4:0] opUAL,
    output CO,
    output OV,
    output Z,
    output [31:0] F
    );
    
    wire [31:0] tmpSet, tmpSgn, tmpF;
    wire [32:0] tmpC;
    wire tmpOV, tmpSetS, tmpSetU, tmpSetFLSB;
    
    assign tmpC[0] = opUAL[2];
       
    
    generate
        genvar i;
        for(i=0; i<=31; i=i+1)
            begin: struct_UAL
            ual1 Ux(
            .inva(opUAL[3]),
            .invb(opUAL[2]),
            .ci(tmpC[i]),
            .f(tmpF[i]), 
            .sgn(tmpSgn[i]),
            .a(A[i]), .b(B[i]),
            .set(tmpSet[i]),
            .co(tmpC[i+1]),
            .selOP(opUAL[1:0])
            
            );  
    
            end
          
            
    endgenerate
   
    mux2 Uy(.din0(tmpSetS), .din1(tmpSetU), .sel(opUAL[4]), .dout(tmpSetFLSB));
    
    assign tmpSetU = ~tmpC[32];
    assign tmpOV = tmpC[32]^tmpC[31];
    assign tmpSetS = tmpOV ^ tmpSgn[31];
    assign CO = tmpC[32];
    assign OV = tmpOV;
    assign tmpSet[0]=tmpSetFLSB;
    assign tmpSet[31:1]=31'b0;
    assign F=tmpF;
    assign Z=~(|tmpF);
    
    
    
   
    
endmodule
