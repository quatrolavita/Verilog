`timescale 1ns/10ps

module aoutomat(i_en, i_clk, i_rst, o_max);

input i_en, i_clk, i_rst;

output reg o_max;

reg  [1:0] state ;

parameter [1:0] state_A=0, state_B=1, state_C=2, state_D=3;

always @ (posedge i_clk or negedge i_rst)
    begin      
       if (i_rst) begin
	state = state_A;
end

        case(state)
          state_A:
          if (i_en ==0)
            state = state_A;
	    
          else
            state = state_B;
	    
          state_B:
	  if (i_en ==0)
            state = state_B;	    
	  else
            state = state_C;	    
          state_C:
 	  if (i_en ==0)
            state = state_C;	   
          else
            state = state_D;	   
 	  state_D:
 	  if (i_en ==0)
            state = state_D;	 
          else
            state = state_A;
           
           default: state = state_A;
              endcase
            end
				
		always @(i_en)
            begin
              case (state)
                state_A: o_max=0;
                state_B: o_max=0;
                state_C:
		o_max=0;
		 state_D:
			if (i_en)  
		  o_max=1;
		else 
		  o_max=0;
                default: o_max =0;
              endcase
            end
		

       
          endmodule
			 
