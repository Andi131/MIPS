module ALU4(
    input [31:0] addr,
    output [31:0] rez
    );
    
    assign rez=addr+32'd4;
    
endmodule
