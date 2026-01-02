
module AND32(
    input Y0,
    input [31:0] X,
    output [31:0] Z
    );
    wire [31:0] tmp_y;
    assign tmp_y={32{Y0}};
 assign Z=X&tmp_y;
    
    
endmodule
