///////////////////////////////////////////////////////////
// Name File : Pulse.v 												//
// Autor : Dyomkin Pavel Mikhailovich 							//
// Company : GSC RF TRINITI										//
// Description : The generator of a single pulse		  	//
// Start design : 28.10.2020 										//
// Last revision : 28.10.2020 									//
///////////////////////////////////////////////////////////

module Pulse( input clk_Pulse, button, 
				  input [7:0] duration,
				  output reg led
				);
				
reg [29:0] cnt;
initial cnt <= 30'd0;
initial led <= 1'b0;

reg f;
initial f <= 1'b0;


always @(posedge clk_Pulse) begin
		
		
		if (button < 1'b1) begin
			f <= 1'b1;
		end
			
			
		if (f == 1'b1) begin
			led <= 1'b1;
			cnt <= cnt + 1'b1;
		end	
			
			
		if (cnt == duration) begin		   
			cnt <= cnt - duration;
			f <= f - 1'b1;
			led <= 1'b0;	
		end		
			
		
	end

endmodule

