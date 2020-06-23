`timescale 1 ns / 10 ps


module counter(i_clk, i_en, i_load, d_in, q);


input i_clk, i_en, i_load;
input [7:0] d_in;
output reg [7:0] q;

 
always @ (posedge i_clk)
begin
if (i_load)
q <= d_in;
else if (i_en == 1'b1)
q <= q + 1;
end
 
endmodule
