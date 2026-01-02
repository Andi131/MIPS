
module dmux32_32b(
    input din,
    input [4:0] sel,
    output reg dout0, dout1, dout2, dout3, dout4, dout5, dout6, dout7, dout8, dout9, dout10,
     dout11, dout12, dout13, dout14, dout15, dout16, dout17, dout18, dout19, dout20, dout21,
     dout22, dout23, dout24, dout25, dout26, dout27, dout28, dout29, dout30, dout31
    );
    
    always@(sel, din)
        case(sel)
            5'h00: {dout0, dout1, dout2, dout3, dout4, dout5, dout6, dout7, dout8, dout9, dout10,
     dout11, dout12, dout13, dout14, dout15, dout16, dout17, dout18, dout19, dout20, dout21,
     dout22, dout23, dout24, dout25, dout26, dout27, dout28, dout29, dout30, dout31}={din, 31'b0};
            5'h01: {dout0, dout1, dout2, dout3, dout4, dout5, dout6, dout7, dout8, dout9, dout10,
     dout11, dout12, dout13, dout14, dout15, dout16, dout17, dout18, dout19, dout20, dout21,
     dout22, dout23, dout24, dout25, dout26, dout27, dout28, dout29, dout30, dout31}={1'b0,din, 30'b0};
            5'h02: {dout0, dout1, dout2, dout3, dout4, dout5, dout6, dout7, dout8, dout9, dout10,
     dout11, dout12, dout13, dout14, dout15, dout16, dout17, dout18, dout19, dout20, dout21,
     dout22, dout23, dout24, dout25, dout26, dout27, dout28, dout29, dout30, dout31}={2'b0, din, 29'b0};
            5'h03: {dout0, dout1, dout2, dout3, dout4, dout5, dout6, dout7, dout8, dout9, dout10,
     dout11, dout12, dout13, dout14, dout15, dout16, dout17, dout18, dout19, dout20, dout21,
     dout22, dout23, dout24, dout25, dout26, dout27, dout28, dout29, dout30, dout31}={3'b0, din, 28'b0};
            5'h04: {dout0, dout1, dout2, dout3, dout4, dout5, dout6, dout7, dout8, dout9, dout10,
     dout11, dout12, dout13, dout14, dout15, dout16, dout17, dout18, dout19, dout20, dout21,
     dout22, dout23, dout24, dout25, dout26, dout27, dout28, dout29, dout30, dout31}={4'b0, din, 27'b0};
            5'h05: {dout0, dout1, dout2, dout3, dout4, dout5, dout6, dout7, dout8, dout9, dout10,
     dout11, dout12, dout13, dout14, dout15, dout16, dout17, dout18, dout19, dout20, dout21,
     dout22, dout23, dout24, dout25, dout26, dout27, dout28, dout29, dout30, dout31}={5'b0, din, 26'b0};
            5'h06: {dout0, dout1, dout2, dout3, dout4, dout5, dout6, dout7, dout8, dout9, dout10,
     dout11, dout12, dout13, dout14, dout15, dout16, dout17, dout18, dout19, dout20, dout21,
     dout22, dout23, dout24, dout25, dout26, dout27, dout28, dout29, dout30, dout31}={6'b0, din, 25'b0};
            5'h07: {dout0, dout1, dout2, dout3, dout4, dout5, dout6, dout7, dout8, dout9, dout10,
     dout11, dout12, dout13, dout14, dout15, dout16, dout17, dout18, dout19, dout20, dout21,
     dout22, dout23, dout24, dout25, dout26, dout27, dout28, dout29, dout30, dout31}={7'b0, din, 24'b0};
            5'h08: {dout0, dout1, dout2, dout3, dout4, dout5, dout6, dout7, dout8, dout9, dout10,
     dout11, dout12, dout13, dout14, dout15, dout16, dout17, dout18, dout19, dout20, dout21,
     dout22, dout23, dout24, dout25, dout26, dout27, dout28, dout29, dout30, dout31}={8'b0, din, 23'b0};
            5'h09: {dout0, dout1, dout2, dout3, dout4, dout5, dout6, dout7, dout8, dout9, dout10,
     dout11, dout12, dout13, dout14, dout15, dout16, dout17, dout18, dout19, dout20, dout21,
     dout22, dout23, dout24, dout25, dout26, dout27, dout28, dout29, dout30, dout31}={9'b0, din, 22'b0};
            5'h0A: {dout0, dout1, dout2, dout3, dout4, dout5, dout6, dout7, dout8, dout9, dout10,
     dout11, dout12, dout13, dout14, dout15, dout16, dout17, dout18, dout19, dout20, dout21,
     dout22, dout23, dout24, dout25, dout26, dout27, dout28, dout29, dout30, dout31}={10'b0, din, 21'b0}; 
            5'h0B: {dout0, dout1, dout2, dout3, dout4, dout5, dout6, dout7, dout8, dout9, dout10,
     dout11, dout12, dout13, dout14, dout15, dout16, dout17, dout18, dout19, dout20, dout21,
     dout22, dout23, dout24, dout25, dout26, dout27, dout28, dout29, dout30, dout31}={11'b0, din, 20'b0};
            5'h0C: {dout0, dout1, dout2, dout3, dout4, dout5, dout6, dout7, dout8, dout9, dout10,
     dout11, dout12, dout13, dout14, dout15, dout16, dout17, dout18, dout19, dout20, dout21,
     dout22, dout23, dout24, dout25, dout26, dout27, dout28, dout29, dout30, dout31}={12'b0, din, 19'b0};
            5'h0D: {dout0, dout1, dout2, dout3, dout4, dout5, dout6, dout7, dout8, dout9, dout10,
     dout11, dout12, dout13, dout14, dout15, dout16, dout17, dout18, dout19, dout20, dout21,
     dout22, dout23, dout24, dout25, dout26, dout27, dout28, dout29, dout30, dout31}={13'b0, din, 18'b0};
            5'h0E: {dout0, dout1, dout2, dout3, dout4, dout5, dout6, dout7, dout8, dout9, dout10,
     dout11, dout12, dout13, dout14, dout15, dout16, dout17, dout18, dout19, dout20, dout21,
     dout22, dout23, dout24, dout25, dout26, dout27, dout28, dout29, dout30, dout31}={14'b0, din, 17'b0};
            5'h0F: {dout0, dout1, dout2, dout3, dout4, dout5, dout6, dout7, dout8, dout9, dout10,
     dout11, dout12, dout13, dout14, dout15, dout16, dout17, dout18, dout19, dout20, dout21,
     dout22, dout23, dout24, dout25, dout26, dout27, dout28, dout29, dout30, dout31}={15'b0, din, 16'b0};
            5'h10: {dout0, dout1, dout2, dout3, dout4, dout5, dout6, dout7, dout8, dout9, dout10,
     dout11, dout12, dout13, dout14, dout15, dout16, dout17, dout18, dout19, dout20, dout21,
     dout22, dout23, dout24, dout25, dout26, dout27, dout28, dout29, dout30, dout31}={16'b0, din, 15'b0};
            5'h11: {dout0, dout1, dout2, dout3, dout4, dout5, dout6, dout7, dout8, dout9, dout10,
     dout11, dout12, dout13, dout14, dout15, dout16, dout17, dout18, dout19, dout20, dout21,
     dout22, dout23, dout24, dout25, dout26, dout27, dout28, dout29, dout30, dout31}={17'b0, din, 14'b0};
            5'h12: {dout0, dout1, dout2, dout3, dout4, dout5, dout6, dout7, dout8, dout9, dout10,
     dout11, dout12, dout13, dout14, dout15, dout16, dout17, dout18, dout19, dout20, dout21,
     dout22, dout23, dout24, dout25, dout26, dout27, dout28, dout29, dout30, dout31}={18'b0, din, 13'b0};
            5'h13: {dout0, dout1, dout2, dout3, dout4, dout5, dout6, dout7, dout8, dout9, dout10,
     dout11, dout12, dout13, dout14, dout15, dout16, dout17, dout18, dout19, dout20, dout21,
     dout22, dout23, dout24, dout25, dout26, dout27, dout28, dout29, dout30, dout31}={19'b0, din, 12'b0};
            5'h14: {dout0, dout1, dout2, dout3, dout4, dout5, dout6, dout7, dout8, dout9, dout10,
     dout11, dout12, dout13, dout14, dout15, dout16, dout17, dout18, dout19, dout20, dout21,
     dout22, dout23, dout24, dout25, dout26, dout27, dout28, dout29, dout30, dout31}={20'b0, din, 11'b0};
            5'h15: {dout0, dout1, dout2, dout3, dout4, dout5, dout6, dout7, dout8, dout9, dout10,
     dout11, dout12, dout13, dout14, dout15, dout16, dout17, dout18, dout19, dout20, dout21,
     dout22, dout23, dout24, dout25, dout26, dout27, dout28, dout29, dout30, dout31}={21'b0, din, 10'b0};
            5'h16: {dout0, dout1, dout2, dout3, dout4, dout5, dout6, dout7, dout8, dout9, dout10,
     dout11, dout12, dout13, dout14, dout15, dout16, dout17, dout18, dout19, dout20, dout21,
     dout22, dout23, dout24, dout25, dout26, dout27, dout28, dout29, dout30, dout31}={22'b0, din, 9'b0};
            5'h17: {dout0, dout1, dout2, dout3, dout4, dout5, dout6, dout7, dout8, dout9, dout10,
     dout11, dout12, dout13, dout14, dout15, dout16, dout17, dout18, dout19, dout20, dout21,
     dout22, dout23, dout24, dout25, dout26, dout27, dout28, dout29, dout30, dout31}={23'b0, din, 8'b0};
            5'h18: {dout0, dout1, dout2, dout3, dout4, dout5, dout6, dout7, dout8, dout9, dout10,
     dout11, dout12, dout13, dout14, dout15, dout16, dout17, dout18, dout19, dout20, dout21,
     dout22, dout23, dout24, dout25, dout26, dout27, dout28, dout29, dout30, dout31}={24'b0, din, 7'b0};
            5'h19: {dout0, dout1, dout2, dout3, dout4, dout5, dout6, dout7, dout8, dout9, dout10,
     dout11, dout12, dout13, dout14, dout15, dout16, dout17, dout18, dout19, dout20, dout21,
     dout22, dout23, dout24, dout25, dout26, dout27, dout28, dout29, dout30, dout31}={25'b0, din, 6'b0};
            5'h1A: {dout0, dout1, dout2, dout3, dout4, dout5, dout6, dout7, dout8, dout9, dout10,
     dout11, dout12, dout13, dout14, dout15, dout16, dout17, dout18, dout19, dout20, dout21,
     dout22, dout23, dout24, dout25, dout26, dout27, dout28, dout29, dout30, dout31}={26'b0, din, 5'b0};
            5'h1B: {dout0, dout1, dout2, dout3, dout4, dout5, dout6, dout7, dout8, dout9, dout10,
     dout11, dout12, dout13, dout14, dout15, dout16, dout17, dout18, dout19, dout20, dout21,
     dout22, dout23, dout24, dout25, dout26, dout27, dout28, dout29, dout30, dout31}={27'b0, din, 4'b0};
            5'h1C: {dout0, dout1, dout2, dout3, dout4, dout5, dout6, dout7, dout8, dout9, dout10,
     dout11, dout12, dout13, dout14, dout15, dout16, dout17, dout18, dout19, dout20, dout21,
     dout22, dout23, dout24, dout25, dout26, dout27, dout28, dout29, dout30, dout31}={28'b0, din, 3'b0};
            5'h1D: {dout0, dout1, dout2, dout3, dout4, dout5, dout6, dout7, dout8, dout9, dout10,
     dout11, dout12, dout13, dout14, dout15, dout16, dout17, dout18, dout19, dout20, dout21,
     dout22, dout23, dout24, dout25, dout26, dout27, dout28, dout29, dout30, dout31}={29'b0, din, 2'b0};
            5'h1E: {dout0, dout1, dout2, dout3, dout4, dout5, dout6, dout7, dout8, dout9, dout10,
     dout11, dout12, dout13, dout14, dout15, dout16, dout17, dout18, dout19, dout20, dout21,
     dout22, dout23, dout24, dout25, dout26, dout27, dout28, dout29, dout30, dout31}={30'b0, din, 1'b0};
            5'h1F: {dout0, dout1, dout2, dout3, dout4, dout5, dout6, dout7, dout8, dout9, dout10,
     dout11, dout12, dout13, dout14, dout15, dout16, dout17, dout18, dout19, dout20, dout21,
     dout22, dout23, dout24, dout25, dout26, dout27, dout28, dout29, dout30, dout31}={31'b0, din};
        endcase
endmodule
