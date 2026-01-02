module MIPS(
        input clk,
        input rst,
       output [31:0] rd1, rd2, mux2_out, addr_PC, instr,
       output [7:0] Control_signals,
       output [2:0] ALUop,
       output [5:0] ALU_sel,
       output [4:0] addr1_reg, addr2_reg, addr_to_WR,
       output [31:0] ALU_rez,
       output [31:0] ALU_in1, ALU_in2,
       output [31:0] sgn_extout,
       output CO, OV, Z
);
    
    
    wire [31:0] tmp_addr, tmp_addr1, tmp_alu4, tmp_instr;  //PC to Instr memory signals
    
    wire tmp_RegDst, tmp_Jump, tmp_Branch, tmp_MemRead, tmp_MemtoReg, tmp_MemWrite, tmp_ALUSrc, tmp_RegWrite;
    wire [2:0] tmp_ALUOp; //signal Control Unit<=> ALU
    wire [4:0] tmp_WR; //signal Control Unit <=> Reg File
    wire [31:0] data_to_RF;  //signal MUX_2 <=> reg File
    wire [31:0] tmp_RD1, tmp_RD2; //signal Reg File <=> ALU
    wire [31:0] tmp_sgn_ext;  // signal Sign Extend <=> mux_2, shift_l2
    wire [31:0] tmp_ALU_in2;  // signal mux_2 <=> ALU
    wire [5:0]  tmp_ALU_ctrl; // signal ALU Control <=> ALU32
    wire [31:0] tmp_ALU_rez;  // signal ALU <=> Data memory
    wire tmp_zero;            // signal ALU <=> AND gate used for branch
    wire [31:0] tmp_data_mem; //signal Data memory <=> Mux2
    wire [27:0] tmp_shift; //signal out shift up
    wire [31:0] tmp_jmp_addr;  // {tmp_alu4[31:28],tmp_shift}
    wire [31:0] tmp_rez_beq;   //ALU beq <=> Mux 2
    wire and_branch;           //AND gate <=> Mux 2
    wire [31:0] mux_to_mux;    //Mux 2 <=> Mux 2
    
    assign Control_signals={tmp_RegDst, tmp_Jump, tmp_Branch, tmp_MemRead, tmp_MemtoReg, tmp_MemWrite, tmp_ALUSrc, tmp_RegWrite};
    
    //Instruction manipulating
    PC U0(.addr_in(tmp_addr), .addr_out(tmp_addr1), .clk(clk), .rst(rst));
   
    Instruction_Memory U1(.addr_in(tmp_addr1), .instr(tmp_instr));
    
    ALU4 U2(.addr(tmp_addr1), .rez(tmp_alu4));  //Next addr calculation
    
    //Decoding address
    mux2_instr U3(.din0(tmp_instr[20:16]), .din1(tmp_instr[15:11]), .sel(tmp_RegDst), .out(tmp_WR));
    
    Control_unit U4(.op(tmp_instr[31:26]), .RegDst(tmp_RegDst), .jump(tmp_Jump),
                    .Branch(tmp_Branch), .MemRead(tmp_MemRead), .MemtoReg(tmp_MemtoReg), .ALUSrc(tmp_ALUSrc),
                    .RegWrite(tmp_RegWrite), .MemWrite(tmp_MemWrite), .ALUop(tmp_ALUOp));
    
    
    //Data calling
    Reg_files U5(.clk(clk), .rst(rst), .Read_A(tmp_instr[25:21]), .Read_B(tmp_instr[20:16]),
                     .WR(tmp_WR), .data(data_to_RF), .Data_A(tmp_RD1), .Data_B(tmp_RD2),
                     .RegWrite(tmp_RegWrite));
    
    //Execution
    mux_2 U6(.din0(tmp_RD2), .din1(tmp_sgn_ext), .sel(tmp_ALUSrc), .out(tmp_ALU_in2));
    
    ALU_control U7(.funct(tmp_instr[5:0]), .ALU_op(tmp_ALUOp), .ALUControl(tmp_ALU_ctrl));
    
    ALU_TOP U8(.A(tmp_RD1), .B(tmp_ALU_in2), .opUAL(tmp_ALU_ctrl), .Rez(tmp_ALU_rez), .Z(tmp_zero), .CO(CO), .OV(OV));
    
    //Data store
    Data_memory U9(.addr(tmp_ALU_rez), .wr_data(tmp_RD2), .rd_data(tmp_data_mem), .clk(clk), 
                        .wr_mem(tmp_MemWrite), .rd_mem(tmp_MemRead));
                    
    mux_2 U10(.din0(tmp_ALU_rez), .din1(tmp_data_mem), .sel(tmp_MemtoReg), .out(data_to_RF));
    
    //Next address calculation
    Sign_extend U11(.word(tmp_instr[15:0]), .d_word(tmp_sgn_ext));
    
    shift_up U12(.in(tmp_instr[25:0]), .out(tmp_shift));
    
    assign tmp_jmp_addr={tmp_alu4[31:28],tmp_shift};
    
    ALU_beq U14(.sht_addr(tmp_sgn_ext), .rez(tmp_rez_beq));
    
    assign and_branch=tmp_zero&tmp_Branch;
    mux_2 U15(.din0(tmp_alu4), .din1(tmp_rez_beq), .sel(and_branch), .out(mux_to_mux));
    
    mux_2 U16(.din0(mux_to_mux), .din1(tmp_jmp_addr), .sel(tmp_Jump), .out(tmp_addr));
    
    
    assign rd1=tmp_RD1;   //lines only for test 
    assign rd2=tmp_RD2;
    assign mux2_out=data_to_RF;
    assign addr_PC=tmp_addr1;
    assign instr=tmp_instr;
    /*assign RegDst=tmp_RegDst;
    assign RegWrite=tmp_RegWrite;
    assign ALUop=tmp_ALUOp;
    assign MemRead=tmp_MemRead;*/
    assign addr1_reg=tmp_instr[25:21];
    assign addr2_reg=tmp_instr[20:16];
    assign addr_to_WR=tmp_WR;
    assign ALU_rez=tmp_ALU_rez;
    assign ALUop=tmp_ALUOp;
    assign ALU_sel=tmp_ALU_ctrl;
    assign ALU_in1=tmp_RD1;
    assign ALU_in2=tmp_ALU_in2;
    assign sgn_extout=tmp_sgn_ext;
    assign Z=tmp_zero;
endmodule
