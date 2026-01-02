
module rpp32(
    input clk,
    input rst,
    input ld,
    input [31:0] d,
    output [31:0] q
    );
    
    reg [31:0] tmp; 
    
    always@(posedge clk, posedge rst)
        begin   
            if(rst)
              tmp <= 31'b0;
            else if(ld)
              tmp <= d;
        end
        
    assign q = tmp;
endmodule
