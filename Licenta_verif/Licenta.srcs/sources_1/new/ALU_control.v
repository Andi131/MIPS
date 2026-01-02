module ALU_control(
    input [5:0] funct,
    input [2:0] ALU_op,
    output reg [5:0] ALUControl
    );
    
     always @(ALU_op, funct) begin
      casex ({ALU_op , funct})
        9'b001_xxxxxx : ALUControl = 6'b000010; //lw/sw/addi
        9'b010_xxxxxx : ALUControl = 6'b000110; //beq
        9'b011_xxxxxx : ALUControl = 6'b000110; //subi
        9'b100_xxxxxx : ALUControl = 6'b000000; //andi
        9'b101_xxxxxx : ALUControl = 6'b000001; //ori
        9'b110_xxxxxx : ALUControl = 6'b01xxxx; //mulli
        9'b111_xxxxxx : ALUControl = 6'b10xxxx; //xori
        
        9'b000_100100 : ALUControl = 6'b000000;//and
        9'b000_100101 : ALUControl = 6'b000001;//or
        9'b000_000000 : ALUControl = 6'b001100;//nor
        9'b000_100000 : ALUControl = 6'b000010;//add
        9'b000_100010 : ALUControl = 6'b000110;//subtract
        9'b000_101010 : ALUControl = 6'b000111;//set less than
        9'b000_101011 : ALUControl = 6'b01xxxx;//mull
        9'b000_110001 : ALUControl = 6'b10xxxx;//XOR
        9'b000_110011 : ALUControl = 6'b11xxxx;//Sht_L
        
        
      endcase
    end
endmodule
    
