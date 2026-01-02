
module mux32_32b(
    input [31:0] din0, din1, din2, din3, din4, din5, din6, din7, din8, din9, din10, din11,
     din12, din13, din14, din15, din16, din17, din18, din19, din20, din21, din22, din23,
     din24, din25, din26, din27, din28, din29, din30, din31,
    input [4:0] sel,
    output reg [31:0] dout
    );
    
    always @(sel, din0, din1, din2, din3)
    case(sel)
    5'h00: dout = din0;  5'h01: dout = din1;  5'h02: dout = din2;  5'h03: dout = din3; 
    5'h04: dout = din4;  5'h05: dout = din5;  5'h06: dout = din6;  5'h07: dout = din7;
    5'h08: dout = din8;  5'h09: dout = din9;  5'h0A: dout = din10;  5'h0B: dout = din11;
    5'h0C: dout = din12;  5'h0D: dout = din13;  5'h0E: dout = din14;  5'h0F: dout = din15;
    5'h10: dout = din16;  5'h11: dout = din17;  5'h12: dout = din18;  5'h13: dout = din19; 
    5'h14: dout = din20;  5'h15: dout = din21;  5'h16: dout = din22;  5'h17: dout = din23;
    5'h18: dout = din24;  5'h19: dout = din25;  5'h1A: dout = din26;  5'h1B: dout = din27;
    5'h1C: dout = din28;  5'h1D: dout = din29;  5'h1E: dout = din30;  5'h1F: dout = din31;
    default: dout = 32'bx;
    endcase
    
    
    
endmodule
