module PC(
    input [31:0] addr_in,
    output reg [31:0] addr_out,
    input clk,
    input rst
    );
    
    always@(posedge clk, posedge rst)
        begin
            if(rst)
                addr_out<=32'h0000_0000;
            else
                addr_out<=addr_in;
        end
endmodule
