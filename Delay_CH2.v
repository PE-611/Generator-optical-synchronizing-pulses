/////////////////////////////////////////////////////////////////
// Name File : Delay.v 														//
// Autor : Dyomkin Pavel Mikhailovich 									//
// Company : GSC RF TRINITI												//
// Description : The generator of a delay between light pulses	//
// Start design : 28.10.2020 												//
// Last revision : 28.10.2020 											//
/////////////////////////////////////////////////////////////////

module Delay_CH2( input clk_Delay, DL_launch,
				  input [50:0] delay, 
				  output reg DL_out, launch_PL 
				 );
				
reg [35:0] cnt1;
initial cnt1 <= 35'd0;
initial DL_out <= 1'b0;
initial launch_PL <= 1'b0;


always @(posedge clk_Delay) begin
		
		
		
		if (DL_launch == 1'b1) begin
			cnt1 <= cnt1 + 1'b1;
			DL_out <= 1'b1;
		end
		
		if (cnt1 >= delay) begin
			DL_out <= 1'b0;
			launch_PL <= 1'b1;
		end	
		
		if (DL_launch == 1'b0) begin
			cnt1 <= 1'b0;
		   launch_PL <= 1'b0;	
		end
	
end




endmodule





