module mux2_instr(
    input [4:0] din0,
    input [4:0] din1,
    input sel,
    output reg [4:0] out
    );
    
    always@*
        case(sel)
            1'b0: out=din0;
            1'b1: out=din1;
            default: out=5'bx;
        endcase
endmodule
