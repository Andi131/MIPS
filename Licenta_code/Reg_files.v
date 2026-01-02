module Reg_files(
    input clk,
    input rst,
    input RegWrite,
    input [4:0] WR,
    input [4:0] Read_A,
    input [4:0] Read_B,
    output [31:0] Data_A,
    output [31:0] Data_B,
    input [31:0] data
    );
    
    wire [31:0] tmpLD;
    wire [31:0] tmpD [31:0];
     
    assign tmpLD[0] = 1'b0;
    generate
        genvar i;
            for(i=0; i<32; i=i+1)
            begin: struct_reg
                rpp32 Ux(.clk(clk), .rst(rst), .ld(tmpLD[i]), .d(data), .q(tmpD[i]));
            end
    endgenerate
    
    mux32_32b UA(.sel(Read_A), .dout(Data_A), .din0(tmpD[0]), .din1(tmpD[1]), .din2(tmpD[2]),
     .din3(tmpD[3]), .din4(tmpD[4]), .din5(tmpD[5]), .din6(tmpD[6]), .din7(tmpD[7]), .din8(tmpD[8]),
     .din9(tmpD[9]), .din10(tmpD[10]), .din11(tmpD[11]), .din12((tmpD[12])), .din13(tmpD[13]),
     .din14(tmpD[14]), .din15(tmpD[15]), .din16(tmpD[16]), .din17(tmpD[17]), .din18(tmpD[18]),
     .din19(tmpD[19]), .din20(tmpD[20]), .din21(tmpD[21]), .din22(tmpD[22]), .din23(tmpD[23]),
     .din24(tmpD[24]), .din25(tmpD[25]), .din26(tmpD[26]), .din27(tmpD[27]), .din28(tmpD[28]),
     .din29(tmpD[29]), .din30(tmpD[30]), .din31(tmpD[31]));
     
    mux32_32b UB(.sel(Read_B), .dout(Data_B), .din0(tmpD[0]), .din1(tmpD[1]), .din2(tmpD[2]),
     .din3(tmpD[3]), .din4(tmpD[4]), .din5(tmpD[5]), .din6(tmpD[6]), .din7(tmpD[7]), .din8(tmpD[8]),
     .din9(tmpD[9]), .din10(tmpD[10]), .din11(tmpD[11]), .din12((tmpD[12])), .din13(tmpD[13]),
     .din14(tmpD[14]), .din15(tmpD[15]), .din16(tmpD[16]), .din17(tmpD[17]), .din18(tmpD[18]),
     .din19(tmpD[19]), .din20(tmpD[20]), .din21(tmpD[21]), .din22(tmpD[22]), .din23(tmpD[23]),
     .din24(tmpD[24]), .din25(tmpD[25]), .din26(tmpD[26]), .din27(tmpD[27]), .din28(tmpD[28]),
     .din29(tmpD[29]), .din30(tmpD[30]), .din31(tmpD[31]));
     
    dmux32_32b Uz(.din(RegWrite), .sel(WR), .dout0(), .dout1(tmpLD[1]), .dout2(tmpLD[2]),
     .dout3(tmpLD[3]), .dout4(tmpLD[4]), .dout5(tmpLD[5]), .dout6(tmpLD[6]), .dout7(tmpLD[7]),
     .dout8(tmpLD[8]), .dout9(tmpLD[9]), .dout10(tmpLD[10]), .dout11(tmpLD[11]), .dout12(tmpLD[12]),
     .dout13(tmpLD[13]), .dout14(tmpLD[14]), .dout15(tmpLD[15]), .dout16(tmpLD[16]), .dout17(tmpLD[17]),
     .dout18(tmpLD[18]), .dout19(tmpLD[19]), .dout20(tmpLD[20]), .dout21(tmpLD[21]), .dout22(tmpLD[22]),
     .dout23(tmpLD[23]), .dout24(tmpLD[24]), .dout25(tmpLD[25]), .dout26(tmpLD[26]), .dout27(tmpLD[27]),
     .dout28(tmpLD[28]), .dout29(tmpLD[29]), .dout30(tmpLD[30]), .dout31(tmpLD[31])); 
endmodule
