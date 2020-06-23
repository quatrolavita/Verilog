


module control_unit(sel_op, i_0, i_1, i_2, i_3, o_d0, o_d1, o_d2, o_d3, control_sig, o_sel);


parameter WIDTH = 16;

input [3:0] sel_op;

input [WIDTH-1:0] i_0, i_1, i_2, i_3;

output reg [WIDTH-1:0] o_d0, o_d1, o_d2, o_d3;

output reg [2:0] control_sig;

output reg [3:0] o_sel;
 