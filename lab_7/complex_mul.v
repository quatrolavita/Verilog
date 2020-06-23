
`timescale 1ns/10ps


module complex_mul (control_sig, re_A, im_A, re_B, im_B, re_C, im_C);

parameter WIDTH = 16;

input [WIDTH-1:0] re_A, re_B, im_A, im_B;
input [1:0] control_sig;

output  [WIDTH-1:0] re_C, im_C;


wire [WIDTH-1:0] mul_0_re, mul_1_re, mul_0_im, mul_1_im;


wire add_sig;

assign add_sig = 1'b0;







mul_div #(.WIDTH(WIDTH)) re_A_im_A( 
		.in_A(re_A),
		.in_B(re_B),
	   .in_opt(control_sig[1:0]), 
	   .out(mul_0_re)
		); 
		
		
mul_div #(.WIDTH(WIDTH)) re_B_im_B( 
		.in_A(im_A),
		.in_B(im_B),
	   .in_opt( control_sig[1:0]), 
	   .out(mul_1_re)
		); 	
		
		
		
add_sub #(.REG_WIDTH(WIDTH)) res_re(
			.op_a(mul_0_re),
			.op_b(mul_1_re),
			.addsub(!add_sig),
			.addsub_result(re_C)
			);
			
			
			
mul_div #(.WIDTH(WIDTH)) re_B_im_A( 
		.in_A(im_A),
		.in_B(re_B),
	   .in_opt(control_sig[1:0]), 
	   .out(mul_0_im)
		); 
		
		
mul_div #(.WIDTH(WIDTH)) re_A_im_B( 
		.in_A(re_A),
		.in_B(im_B),
	   .in_opt(control_sig[1:0]), 
	   .out(mul_1_im)
		); 	
		
		
		
add_sub #(.REG_WIDTH(WIDTH)) res_im(
			.op_a(mul_0_im),
			.op_b(mul_1_im),
			.addsub(add_sig),
			.addsub_result(im_C)
			);			

endmodule
		
		
	
		
		
		
		

