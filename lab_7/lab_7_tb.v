`timescale 1ns/10ps
module lab_7_tb();
parameter WIDTH =16;
reg [WIDTH-1:0] i_d0, i_d1, i_d2, i_d3; 

reg [3:0] i_sel;

wire [WIDTH-1:0] o_0, o_1;


lab_7 lab_7_tb
(
	.i_d0(i_d0) ,	// input [WIDTH-16:0] i_d0_sig
	.i_d1(i_d1) ,	// input [WIDTH-16:0] i_d1_sig
	.i_d2(i_d2) ,	// input [WIDTH-16:0] i_d2_sig
	.i_d3(i_d3) ,	// input [WIDTH-16:0] i_d3_sig
	.i_sel(i_sel) ,	// input [3:0] i_sel_sig
	.o_0(o_0) ,	// output [WIDTH-1:0] o_0_sig
	.o_1(o_1) 	// output [WIDTH-1:0] o_1_sig
);


initial begin 

i_sel = 4'd0; //+

#100 i_sel =4'd1; //-
#100 i_sel =4'd2; //*
#100 i_sel =4'd3; //div
#100 i_sel =4'd4; //shift
#300 i_sel =4'd5; //complex+
#100 i_sel =4'd6; //complex-
#100 i_sel =4'd7; //complex* 
#100 i_sel =4'd8; //complex div

end

initial begin 

i_d0 = 16'h0005;

end

initial begin

i_d1 = 16'h0004;
#600 i_d1 = 16'h0004; //SLL
#100 i_d1 = 16'h0024; //ROL
end
initial begin 

i_d2 = 16'h0003;

end

initial begin 

i_d3 = 16'h0002;

#600 i_d3 = 16'h0014; //SRL
#100 i_d3 = 16'h0034; //ROR

end 

initial begin 

#1500 $finish;
end

defparam lab_7_tb.WIDTH = WIDTH;


endmodule
