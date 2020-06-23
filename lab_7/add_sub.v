`timescale 1ns/10ps
 

module add_sub(op_a, op_b, addsub, addsub_result, cf);

parameter  REG_WIDTH = 16;

input [REG_WIDTH-1:0] op_a;
input [REG_WIDTH-1:0] op_b;
input addsub;

output reg [REG_WIDTH-1:0] addsub_result;

output reg cf = 0;

wire [REG_WIDTH-1:0] temp;

assign temp = op_b ^ {REG_WIDTH{addsub}};

always @* begin
  
	{cf, addsub_result} = op_a + temp | addsub;
	
	
end
endmodule
