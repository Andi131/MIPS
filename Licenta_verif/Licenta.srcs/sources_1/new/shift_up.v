module shift_up(
    input [25:0] in,
    input [27:0] out
    );
    
    assign out={2'b00,in};
    
endmodule
