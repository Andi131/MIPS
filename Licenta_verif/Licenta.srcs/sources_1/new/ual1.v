module ual1(
    input a,
    input b,
    input set,
    input inva,
    input invb,
    input ci,
    input [1:0] selOP,
    output co,
    output f,
    output sgn
    );
   
    
    wire tmpA, tmpB;
    wire tmpAndNor, tmpOR, tmpAddSub; 
    
    assign tmpA      = a ^ inva;
    assign tmpB      = b ^ invb;
    assign tmpAndNor = tmpA & tmpB;
    assign tmpOr     = tmpA | tmpB;
    assign sgn = tmpAddSub; 
    
    add1b U0(
    .a(tmpA), 
    .b(tmpB),
    .ci(ci),
    .s(tmpAddSub),
    .co(co)
    );
    
    mux4 U1(
    .din0(tmpAndNor),
    .din1(tmpOr),
    .din2(tmpAddSub),
    .din3(set),
    .sel(selOP), 
    .dout(f)
    );
    
    
endmodule
