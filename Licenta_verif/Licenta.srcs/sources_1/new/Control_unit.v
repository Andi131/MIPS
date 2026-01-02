module Control_unit(
    input [5:0] op,
    output reg RegDst, jump, Branch, MemtoReg, ALUSrc, RegWrite, MemWrite, MemRead,
    output reg [2:0] ALUop
    );
    
    
    always@(op)
    begin
        casex(op)
            6'b000000: begin  //R Type instruction
            RegDst =1'b1; jump = 1'b0; ALUop = 3'b000; Branch = 1'b0; MemRead=1'b1;
            MemtoReg = 1'b0; RegWrite =1'b1; MemWrite =1'b0; ALUSrc =1'b0;
            end
            
            6'b100011: begin  //I Type lw instruction
            RegDst =1'b0; jump =1'b0; ALUop = 3'b001; Branch =1'b0; MemRead=1'b1;
            MemtoReg =1'b1; RegWrite =1'b1; MemWrite =1'b0; ALUSrc =1'b1;
            end
            
            6'b101011: begin  //I type sw instruction
            RegDst = 1'bx; jump =1'b0; ALUop = 3'b001; Branch =1'b0; MemRead=1'b0;
            MemtoReg =1'dX; RegWrite =1'b0; MemWrite =1'b1; ALUSrc=1'b1;
            end
            
            6'b001000: begin  //I type addi instruction
            RegDst =1'b0; jump =1'b0; ALUop = 3'b001; Branch =1'b0; MemRead=1'b0; 
            MemtoReg =1'b0; RegWrite =1'b1; MemWrite =1'b0; ALUSrc =1'b1;
            end
            
            6'b000100: begin  //I type beq instruction
            RegDst = 1'bX; jump =1'b0; ALUop = 3'b010; Branch =1'b1; MemRead=1'b0;
            MemtoReg = 1'bX; RegWrite =1'b0; MemWrite =1'b0; ALUSrc =1'b0;
            end
            
            6'b000001: begin  //I type subi instruction
            RegDst =1'b0; jump =1'b0; ALUop = 3'b011; Branch =1'b0; MemRead=1'b0; 
            MemtoReg =1'b0; RegWrite =1'b1; MemWrite =1'b0; ALUSrc =1'b1;
            end
            
            6'b000011: begin  //I type andi instruction
            RegDst =1'b0; jump =1'b0; ALUop = 3'b100; Branch =1'b0; MemRead=1'b0; 
            MemtoReg =1'b0; RegWrite =1'b1; MemWrite =1'b0; ALUSrc =1'b1;
            end
            
            6'b000111: begin  //I type ori instruction
            RegDst =1'b0; jump =1'b0; ALUop = 3'b101; Branch =1'b0; MemRead=1'b0; 
            MemtoReg =1'b0; RegWrite =1'b1; MemWrite =1'b0; ALUSrc =1'b1;
            end
     
            6'b001111: begin  //I type mulli instruction
            RegDst =1'b0; jump =1'b0; ALUop = 3'b110; Branch =1'b0; MemRead=1'b0; 
            MemtoReg =1'b0; RegWrite =1'b1; MemWrite =1'b0; ALUSrc =1'b1;
            end
            
            6'b011111: begin  //I type xori instruction
            RegDst =1'b0; jump =1'b0; ALUop = 3'b111; Branch =1'b0; MemRead=1'b0; 
            MemtoReg =1'b0; RegWrite =1'b1; MemWrite =1'b0; ALUSrc =1'b1;
            end
            
            6'b000010: begin  //J type jmp instruction
            RegDst = 1'bX; jump =1'b1; ALUop = 2'bXX; Branch = 1'bX; MemRead=1'bx;
            MemtoReg = 1'bX; RegWrite =1'b0; MemWrite =1'b0;  ALUSrc = 1'bX;
            end
            
            default: begin
            RegDst =1'b0; jump =1'b0; ALUop =2'b00; Branch =1'b0; MemtoReg =1'b0; RegWrite =1'b0;
            MemWrite =1'b0; ALUSrc =1'b0;
            end
        endcase
    end
endmodule
