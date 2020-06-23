`timescale 1ns/10ps

module my_alu_tb;

reg [7:0] a_i;
reg [7:0] b_i;
reg [1:0] sel;
wire [7:0] result;
wire result_c;

my_alu my_alu_inst
(
	.a_i(a_i) ,	// input [7:0] a_i_sig
	.b_i(b_i) ,	// input [7:0] b_i_sig
	.select_i(sel) ,	// input [1:0] select_i_sig
	.c_o(result_c) ,	// output  c_o_sig
	.s_o(result) 	// output [7:0] s_o_sig
);

initial begin 

a_i = 8'b00000000;

#20 a_i = 8'b00000011;
#60 a_i = 8'b11111111;
end

initial begin

b_i = 8'b00000000;

#20 b_i = 8'b00000011;

end

initial begin

sel = 2'b00;

#20 sel = 2'b00;
#30 sel = 2'b01;
#40 sel = 2'b10;
#50 sel = 2'b11;
#60 sel = 2'b00;
end

initial begin 

#400 $finish;   

end

endmodule