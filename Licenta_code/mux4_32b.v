
module mux4_32b(
    input [31:0] din0,
    input [31:0] din1,
    input [31:0] din2,
    input [31:0] din3,
    input [1:0] sel,
    output reg [31:0] dout
    );
    
    always @(sel, din0, din1, din2, din3)
    case(sel)
    2'b00: dout = din0;
    2'b01: dout = din1;
    2'b10: dout = din2;
    2'b11: dout = din3;
    default: dout = 32'bx;
    endcase
    
    
    
endmodule
