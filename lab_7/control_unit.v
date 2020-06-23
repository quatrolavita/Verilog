
`define ADD 4'b0000

`define SUB 4'b0001

`define MUL 4'b0010

`define DIV 4'b0011

`define SHIFT 4'b0100

`define ADD_C 4'b0101

`define SUB_C 4'b0110

`define MUL_C 4'b0111

`define DIV_C 4'b1???

`timescale 1ns/10ps

module control_unit(sel_op, i_0, i_1, i_2, i_3, o_d0, o_d1, o_d2, o_d3, control_sig, o_sel);


parameter WIDTH = 16;

input [3:0] sel_op;

input [WIDTH-1:0] i_0, i_1, i_2, i_3;

output reg [WIDTH-1:0] o_d0, o_d1, o_d2, o_d3;

output reg [2:0] control_sig;

output reg [3:0] o_sel;
 
 
always @* begin

	casez(sel_op)
		 `ADD : begin
			o_d0 = i_0;
			o_d1 = i_1;
			o_d2 = i_2;
			o_d3 = i_3;
			control_sig = 3'b000;
			o_sel = `ADD;
			end
					
		 `SUB : begin
			o_d0 = i_0;
			o_d1 = i_1;
			o_d2 = i_2;
			o_d3 = i_3;
			control_sig = 3'b001;
			o_sel = `SUB;
			end
		 
		 `MUL : begin
			o_d0 = i_0;
			o_d1 = i_1;
			o_d2 = i_2;
			o_d3 = i_3;
			control_sig = 3'b000;
			o_sel = `MUL;
			end
		 
		
		 `DIV : begin
			o_d0 = i_0;
			o_d1 = i_1;
			o_d2 = i_2;
			o_d3 = i_3;
			control_sig = 3'b001;
			o_sel = `DIV;
			end
		 
		  `SHIFT : begin
			o_d0 = i_0;
			o_d1 = i_1;
			o_d2 = i_2;
			o_d3 = i_3;
			control_sig = 3'b000;
			o_sel = `SHIFT;
			end
		 
		  `ADD_C : begin
			o_d0 = i_0;
			o_d1 = i_2;
			o_d2 = i_1;
			o_d3 = i_3;
			control_sig = 3'b000;
			o_sel = `ADD_C;
			end
		 
		`SUB_C : begin
			o_d0 = i_0;
			o_d1 = i_2;
			o_d2 = i_1;
			o_d3 = i_3;
			control_sig = 3'b001;
			o_sel = `SUB_C;
			end
		 
		`MUL_C : begin
			o_d0 = i_0;
			o_d1 = i_1;
			o_d2 = i_2;
			o_d3 = i_3;
			control_sig = 3'b000;
			o_sel = `MUL_C;
			end
			
			
			`DIV_C : begin
			o_d0 = i_0;
			o_d1 = i_1;
			o_d2 = i_2;
			o_d3 = i_3;
			control_sig = 3'b001;
			o_sel = `DIV_C;
			end
		 
		 default : begin
		 	o_d0 = i_0;
			o_d1 = i_1;
			o_d2 = i_2;
			o_d3 = i_3;
			control_sig = 3'b000;
			o_sel = `ADD;
		 end
		 
	endcase 
	end
endmodule
