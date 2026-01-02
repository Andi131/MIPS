module mux2(
    input din0,
    input din1,
    input sel,
    output reg dout
    );
    
    always @(sel, din0, din1)
    case(sel)
    1'b0: dout = din0;
    1'b1: dout = din1;
    
    endcase
    
endmodule

