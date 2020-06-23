`timescale 1ns/10ps

module complex_div(control_sig, re_A, im_A, re_B, im_B, re_C, im_C);

parameter WIDTH = 16;

input [WIDTH-1:0] re_A, re_B, im_A, im_B;

input [1:0] control_sig;

output  [WIDTH-1:0] re_C, im_C;


wire [WIDTH-1:0] add_0_re, add_1_re, div_0_re, div_1_re, pow_0_re, pow_1_re, sub_0_im, sub_1_im, div_0_im, div_1_im;

wire  [1:0] control_mul;

assign control_mul = 3'b010;

wire add_sig;

assign add_sig = 1'b0;

//RE_C

mul_div #(.WIDTH(WIDTH)) re_A_re_B( 
		.in_A(re_A),
		.in_B(re_B),
	   .in_opt(control_mul), 
	   .out(add_0_re)
		); 
		
		
mul_div #(.WIDTH(WIDTH)) im_A_im_B( 
		.in_A(im_A),
		.in_B(im_B),
	   .in_opt(control_mul), 
	   .out(add_1_re)
		); 

add_sub #(.REG_WIDTH(WIDTH)) div0_re(
			.op_a(add_0_re),
			.op_b(add_1_re),
			.addsub(add_sig),
			.addsub_result(div_0_re)
			);	
			
			
			
mul_div #(.WIDTH(WIDTH)) re_B_re_B( 
		.in_A(re_B),
		.in_B(re_B),
	   .in_opt(control_mul), 
	   .out(pow_0_re)
		); 
		
		
mul_div #(.WIDTH(WIDTH)) im_B_im_B( 
		.in_A(im_B),
		.in_B(im_B),
	   .in_opt(control_mul), 
	   .out(pow_1_re)
		); 

add_sub #(.REG_WIDTH(WIDTH)) div1_re(
			.op_a(pow_0_re),
			.op_b(pow_1_re),
			.addsub(add_sig),
			.addsub_result(div_1_re)
			);	
			
			
mul_div #(.WIDTH(WIDTH)) result_re( 
		.in_A(div_0_re),
		.in_B(div_1_re),
	   .in_opt(control_sig), 
	   .out(re_C)
		);			
			
			
//IM_C			
			
mul_div #(.WIDTH(WIDTH)) im_A_re_B( 
		.in_A(im_A),
		.in_B(re_B),
	   .in_opt(control_mul), 
	   .out(sub_0_im)
		); 
		
		
mul_div #(.WIDTH(WIDTH-1)) re_A_im_B( 
		.in_A(re_A),
		.in_B(im_B),
	   .in_opt(control_mul), 
	   .out(sub_1_im)
		); 

add_sub #(.REG_WIDTH(WIDTH)) sub_im(
			.op_a(sub_0_im),
			.op_b(sub_1_im),
			.addsub(!add_sig),
			.addsub_result(div_0_im)
			);	
			


add_sub #(.REG_WIDTH(WIDTH)) add_im(
			.op_a(pow_0_re),
			.op_b(pow_1_re),
			.addsub(add_sig),
			.addsub_result(div_1_im)
			);	
			
			
mul_div #(.WIDTH(WIDTH)) result_im( 
		.in_A(div_0_im),
		.in_B(div_1_im),
	   .in_opt(control_sig), 
	   .out(im_C)
		);			
			
			
endmodule			
			
			
			
			
			
			
			