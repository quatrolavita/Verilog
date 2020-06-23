
`timescale 1ns/10ps

module counter_tb;

reg [7:0] d_in;
reg i_clk, i_en, i_load;
wire [7:0] q;
integer i;


counter counter_tb
(
	.i_clk(i_clk) ,
	.i_en(i_en) ,	
	.i_load(i_load) ,	
	.d_in(d_in),
	.q(q)
);

initial begin
i_clk = 0;
forever #1 i_clk = ~i_clk;

end


initial begin

d_in = 0;

for(i=0; i<=19; i=i+1) begin
	d_in = i;
	#5;
	end
end

initial begin

i_load = 1;
#2 i_load = 0;
#30 i_load = 1;
#2 i_load = 0;
end

initial begin

i_en = 1;
#10 i_en = 0;
#5 i_en = 1;
end


initial begin
	#100 $stop();
end


endmodule
