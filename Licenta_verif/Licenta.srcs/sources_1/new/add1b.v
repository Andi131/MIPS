module add1b(
    input a,
    input b,
    input ci,
    output co,
    output s
    );
    
    assign {co,s} = a + b + ci;
endmodule
