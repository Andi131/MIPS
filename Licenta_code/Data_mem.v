
module Data_mem(
    input clk,
    input wr_mem,
    input rd_mem,
    input [31:0] addr,
    input [31:0] wr_data,
    output reg [31:0] rd_data
    );
    
    reg [7:0] rom [1023:0];
    
    always@(posedge clk)
        begin
            if(wr_mem)
                begin
                rom[addr]<= wr_data[31:24];
                rom[addr+1]<=wr_data[23:16];
                rom[addr+2]<=wr_data[15:8];
                rom[addr+3]<=wr_data[7:0];
                end
            else if(rd_mem) 
                rd_data[31:24]<= rom[addr];
                rd_data[23:16]<= rom[addr+1];
                rd_data[15:8]<= rom[addr+2];
                rd_data[7:0]<= rom[addr+3];
        end
    
endmodule
