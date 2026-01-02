module mux_2(
    input [31:0] din0,
    input [31:0] din1,
    input sel,
    output reg [31:0] out
    );
    
    always@*
        case(sel)
            1'b0: out=din0;
            1'b1: out=din1;
            default: out=32'bx;
         endcase
endmodule
