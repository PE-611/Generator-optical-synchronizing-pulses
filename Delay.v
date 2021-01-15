/////////////////////////////////////////////////////////////////
// Name File : Delay.v 														//
// Autor : Dyomkin Pavel Mikhailovich 									//
// Company : GSC RF TRINITI												//
// Description : The generator of a delay between light pulses	//
// Start design : 28.10.2020 												//
// Last revision : 28.10.2020 											//
/////////////////////////////////////////////////////////////////
/*
module Delay( input clk_Delay, trig,
				  input [31:0] duration, 
				  output reg out 
				 );
				
reg [31:0] cnt1;
initial cnt1 <= 30'd0;
initial out <= 1'b0;


always @(posedge clk_Delay) begin
		
		
		
		if (trig == 1'b1) begin
			cnt1 <= cnt1 + 1'b1;
			out <= 1'b1;
		end
		
		if (cnt1 >= duration) begin
			out <= 1'b0;
		end	
		
		if (start == 1'b0) begin
			cnt1 <= 1'b0;	
		end
	
end




endmodule
*/




