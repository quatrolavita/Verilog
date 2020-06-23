
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

module output_unit(i_add_0, i_add_1, i_sub_0, i_sub_1, i_mul_0, i_mul_1,
						i_div_0, i_div_1, i_shift_0, i_shift_1, i_addc_0, i_addc_1,
						i_subc_0, i_subc_1, i_mulc_0, i_mulc_1, i_divc_0, i_divc_1, 
						i_sel, o_0, o_1);
						

						
parameter WIDTH = 16;

input [WIDTH-1:0] i_add_0, i_add_1, i_sub_0, i_sub_1, i_mul_0, i_mul_1,
						i_div_0, i_div_1, i_shift_0, i_shift_1, i_addc_0, i_addc_1,
						i_subc_0, i_subc_1, i_mulc_0, i_mulc_1, i_divc_0, i_divc_1;
						
input [3:0] i_sel;

output reg [WIDTH-1:0] o_0, o_1;



always @* begin


	casez(i_sel)
		 `ADD : begin
			o_0 = i_add_0;
			o_1 = i_add_1;
			end
					
		 `SUB : begin
			o_0 = i_sub_0;
			o_1 = i_sub_1;
			end
		 
		 `MUL : begin
			o_0 = i_mul_0;
			o_1 = i_mul_1;
			end
		 
		
		 `DIV : begin
			o_0 = i_div_0;
			o_1 = i_div_1;
			end
		 
		  `SHIFT : begin
			o_0 = i_shift_0;
			o_1 = i_shift_1;
			end
		 
		  `ADD_C : begin
			o_0 = i_addc_0;
			o_1 = i_addc_1;
			end
		 
		`SUB_C : begin
			o_0 = i_subc_0;
			o_1 = i_subc_1;
			end
		 
		`MUL_C : begin
			o_0 = i_mulc_0;
			o_1 = i_mulc_1;
			end
			
			
			`DIV_C : begin
			o_0 = i_divc_0;
			o_1 = i_divc_1;
			end
		 
		 default : begin
		 	o_0 = i_add_0;
			o_1 = i_add_1;
		 end
		 
	endcase 
	end
endmodule
