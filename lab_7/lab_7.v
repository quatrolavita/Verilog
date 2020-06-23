
`timescale 1ns/10ps


module lab_7(i_d0, i_d1, i_d2, i_d3, i_sel, o_0, o_1);


parameter WIDTH = 16;

input [WIDTH-1:0] i_d0, i_d1, i_d2, i_d3;

input [3:0] i_sel;

output [WIDTH-1:0] o_0, o_1;


wire [WIDTH-1:0] o_control_d0, o_control_d1, o_control_d2, o_control_d3,
					o_add_sub_0, o_add_sub_1, o_mul_div_0, o_mul_div_1,
					o_shift_0, o_shift_1, o_cmul_0, o_cmul_1, o_cdiv_0, o_cdiv_1; 
					
wire [WIDTH-1:0] out_1, out_2;
wire [3:0] o_sel;
wire [2:0] control_sig;

control_unit #(.WIDTH(WIDTH)) control(

			.sel_op(i_sel), 
			.i_0(i_d0), 
			.i_1(i_d1),
			.i_2(i_d2), 
			.i_3(i_d3), 
			.o_d0(o_control_d0),
			.o_d1(o_control_d1), 
			.o_d2(o_control_d2), 
			.o_d3(o_control_d3), 
			.control_sig(control_sig), 
			.o_sel(o_sel)
			);
	
	
add_sub #(.REG_WIDTH(WIDTH)) add_0(
			.op_a(o_control_d0),
			.op_b(o_control_d1),
			.addsub(control_sig[0]),
			.addsub_result(o_add_sub_0)
			);
	
	
add_sub #(.REG_WIDTH(WIDTH)) add_1(
			.op_a(o_control_d2),
			.op_b(o_control_d3),
			.addsub(control_sig[0]),
			.addsub_result(o_add_sub_1)
			);
			
mul_div #(.WIDTH(WIDTH)) mul_div_0( 
		.in_A(o_control_d0),
		.in_B(o_control_d1),
	   .in_opt(control_sig[1:0]), 
	   .out(o_mul_div_0)
		);
	
mul_div #(.WIDTH(WIDTH)) mul_div_1( 
		.in_A(o_control_d2),
		.in_B(o_control_d3),
	   .in_opt(control_sig[1:0]), 
	   .out(o_mul_div_1)
		);


barrel_shifter #(.WIDTH(WIDTH)) barrel_shifter0( 
		.bs_opsel(o_control_d1[6:4]),
		.shift_amount(o_control_d1[3:0]),
	   .data_in(o_control_d0), 
	   .result(o_shift_0)
		);

barrel_shifter #(.WIDTH(WIDTH)) barrel_shifter1( 
		.bs_opsel(o_control_d3[6:4]),
		.shift_amount(o_control_d3[3:0]),
	   .data_in(o_control_d2), 
	   .result(o_shift_1)
		);  		
			

complex_mul #(.WIDTH(WIDTH)) complex_mul(

		.re_A(o_control_d0), 
		.re_B(o_control_d2), 
		.im_A(o_control_d1), 
		.im_B(o_control_d3),
		.control_sig(control_sig[1:0]),
		.re_C(o_cmul_0), 
		.im_C(o_cmul_1)

		);
			
			
			
complex_div #(.WIDTH(WIDTH)) complex_div(

		.re_A(o_control_d0), 
		.re_B(o_control_d2), 
		.im_A(o_control_d1), 
		.im_B(o_control_d3),
		.control_sig(control_sig[1:0]),
		.re_C(o_cdiv_0), 
		.im_C(o_cdiv_1)

		);
						
			
			
output_unit #(.WIDTH(WIDTH)) untput_unit (

.i_add_0(o_add_sub_0), .i_add_1(o_add_sub_1), 
.i_sub_0(o_add_sub_0), .i_sub_1(o_add_sub_1), 
.i_mul_0(o_mul_div_0), .i_mul_1(o_mul_div_1),
.i_div_0(o_mul_div_0), .i_div_1(o_mul_div_1), 
.i_shift_0(o_shift_0), .i_shift_1(o_shift_1), 
.i_addc_0(o_add_sub_0), .i_addc_1(o_add_sub_1),
.i_subc_0(o_add_sub_0), .i_subc_1(o_add_sub_1), 
.i_mulc_0(o_cmul_0), .i_mulc_1(o_cmul_1), 
.i_divc_0(o_cdiv_0), .i_divc_1(o_cdiv_1),
.i_sel(o_sel),
.o_0(o_0), .o_1(o_1)

);		
			
			
endmodule			
			
			
	
			