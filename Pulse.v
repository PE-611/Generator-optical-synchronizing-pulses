///////////////////////////////////////////////////////////
// Name File : Pulse.v 												//
// Autor : Dyomkin Pavel Mikhailovich 							//
// Company : GSC RF TRINITI										//
// Description : The generator of a single pulse		  	//
// Start design : 28.10.2020 										//
// Last revision : 28.10.2020 									//
///////////////////////////////////////////////////////////
module Pulse (input clk_Pulse, PL_start, PL_launch,
				  input CHTS, 
				  input [34:0] duration, 
				  output reg PL_out, launch_DL
				 );
				
reg [34:0] cnt1;
initial cnt1 <= 35'd0;
initial PL_out <= 1'b0;
initial launch_DL <= 1'b0;


always @(posedge clk_Pulse) begin
				
	if (CHTS == 1'b1) begin
	
		if (PL_start == 7'd1) begin
			cnt1 <= cnt1 + 1'b1;
			PL_out <= 1'b1;
		end
		
		if (cnt1 >= duration) begin
			PL_out <= 1'b0;
			launch_DL <= 1'b1;     
		end	
		
		if (PL_start == 1'b0) begin
			cnt1 <= 1'b0;
		   launch_DL <= 1'b0;		
		end
	
	end
	
	else if (CHTS != 1'b1) begin 
		
		if (PL_launch == 1'b1) begin
			cnt1 <= cnt1 + 1'b1;
			PL_out <= 1'b1;
		end
		
		if (cnt1 >= duration) begin
			PL_out <= 1'b0;
			launch_DL <= 1'b1;     
		end	
		
		if (PL_launch == 1'b0) begin
			cnt1 <= 1'b0;
		   launch_DL <= 1'b0;		
		end
	
	end
	

	
end




endmodule





