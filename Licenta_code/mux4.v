module mux4(
    input din0,
    input din1,
    input din2,
    input din3,
    input [1:0] sel,
    output reg dout
    );
    
    always @(sel, din0, din1, din2, din3)
    case(sel)
    2'b00: dout = din0;
    2'b01: dout = din1;
    2'b10: dout = din2;
    2'b11: dout = din3;
    default: dout = 1'bx;
    endcase
    
    
    
endmodule
