`timescale 1ns/10ps

module sub(a_i, b_i, c_o, result_o);

input [7:0]a_i;

input [7:0]b_i;

output [7:0]result_o;
 
output c_o;


assign {c_o, result_o} = a_i - b_i;

endmodule
