
module instr_mem(
    input  [31:0] addr_in,
    output [31:0] instr
    );
    
    reg [0:7] data [420:0];
    
    initial
        begin
        $readmemb("C:\\Work\\Licenta\\Test1\\instructions.txt", data);
        end
    //adauga fisier cu instructiuni
    assign instr= {data[addr_in],data[addr_in+1],data[addr_in+2],data[addr_in+3]};
    //0<->4 avem o instructiune de 32 biti, instructiunile in fisier sunt aliniate la 1 byte 
endmodule
