`timescale 1ns/10ps

module dect(a_i, result_o);

input [7:0]a_i;

output [7:0]result_o;
 

assign  result_o = a_i - 8'b1;

endmodule
