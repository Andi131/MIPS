module Sign_extend(
    input [15:0] word,
    output [31:0] d_word
    );
    
    assign d_word={{16{word[15]}},word};
    
endmodule
