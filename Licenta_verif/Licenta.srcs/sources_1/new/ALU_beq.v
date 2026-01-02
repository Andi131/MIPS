module ALU_beq(
    input [31:0] sht_addr,
    output [31:0] rez
    );
    
    assign rez=32'b0+sht_addr;
endmodule
