`timescale 1ns/10ps

module my_xor(a_i, b_i,  result_o);

input [7:0]a_i;

input [7:0]b_i;

output [7:0]result_o;
 


assign result_o = a_i ^ b_i;

endmodule
