
module TP(
    input X,
    input Y,
    input PI,
    input CI,
    output CO,
    output PO
    );
    
    wire tmpXY; 
    add1b U0(.a(tmpXY), .b(PI), .ci(CI), .co(CO), .s(PO));
    assign tmpXY=X&Y;
endmodule
