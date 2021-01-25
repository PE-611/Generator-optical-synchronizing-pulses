///////////////////////////////////////////////////////////
// Name File : Pulse.v 												//
// Autor : Dyomkin Pavel Mikhailovich 							//
// Company : GSC RF TRINITI										//
// Description : The generator of a single pulse		  	//
// Start design : 28.10.2020 										//
// Last revision : 28.10.2020 									//
///////////////////////////////////////////////////////////
module Pulse (input clk_Pulse, PL_start, PL_launch,
				  input [3:0] CHTS, 
				  input [4:0] pl_mlt,
				  input [16:0] duration, 
				  output reg PL_out, launch_DL, div_clk
				 );
				
reg [34:0] cnt1;
initial cnt1 <= 35'd0;
initial PL_out <= 1'b0;
initial launch_DL <= 1'b0;

reg [34:0] div_cnt;
initial div_cnt <= 1'b0;
//reg div_clk;
initial div_clk <= 1'b0;
reg [34:0] divider;
initial divider <= 1'b0;


always @(posedge clk_Pulse) begin

	div_cnt <= div_cnt + 1'b1;
	
	if (pl_mlt == 4'd1) begin
		divider <= 1'b1;
	end

	if (pl_mlt == 4'd2) begin
		divider <= 8'd100;
	end
	
	if (pl_mlt == 4'd3) begin
		divider <= 20'd100000;
	end
	
	
	
	if (div_cnt >=	divider) begin
		div_cnt <= 1'b0;
		div_clk <= ~div_clk;
	end
	


end 



always @(posedge div_clk) begin
				
	if (CHTS == 3'd1) begin
	
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
	
	else if (CHTS == 3'd2) begin 
		
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





