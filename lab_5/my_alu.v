`timescale 1ns/10ps

module my_alu(a_i, b_i, select_i,  c_o, s_o);

input [7:0] a_i, b_i;

input [1:0] select_i;

output reg [7:0] s_o;

output reg c_o;

wire [7:0] sum_r, sub_r, xor_r, dec_r;

wire sum_c, sub,c;


// ETERNAL MODULES

add add_0(a_i, b_i, sum_c, sum_r);
sub sub_1(a_i, b_i, sub_c, sub_r);
dect dec_2 (a_i, dec_r);
my_xor my_xor_3(a_i, b_i, xor_r);

always @* begin 

	casez(select_i)
	
		2'b00: 
		
		begin 
		
		s_o = sum_r;
		c_o = sum_c;
		
	end
	
	
		2'b01: 
		
		begin 
		
		s_o = sub_r;
		c_o = sub_c;
		
	end
	
		2'b10: 
		
		begin 
		
		s_o = dec_r;
		c_o = 1'b0;
		
	end
	
		2'b11: 
		
		begin 
		
		s_o = xor_r;
		c_o = 1'b0;
		
	end
	
	default: begin
			s_o = 8'b00000000;
			c_o = 1'b0;
		end
	
	endcase

	end

endmodule












