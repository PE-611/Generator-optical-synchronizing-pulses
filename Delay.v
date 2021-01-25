/////////////////////////////////////////////////////////////////
// Name File : Delay.v 														//
// Autor : Dyomkin Pavel Mikhailovich 									//
// Company : GSC RF TRINITI												//
// Description : The generator of a delay between light pulses	//
// Start design : 28.10.2020 												//
// Last revision : 28.10.2020 											//
/////////////////////////////////////////////////////////////////

module Delay (input clk_Delay, DL_launch,
				  input [16:0] delay,
				  input [4:0] dl_mlt, 
				  output reg DL_out, launch_PL, End_Flg 
				 );
				
reg [34:0] cnt1;
initial cnt1 <= 35'd0;
initial DL_out <= 1'b0;
initial launch_PL <= 1'b0;

reg [34:0] div_cnt;
initial div_cnt <= 1'b0;
reg div_clk;
initial div_clk <= 1'b0;
reg [34:0] divider;
initial divider <= 1'b0;

initial End_Flg <= 1'b0;      ////////////


always @(posedge clk_Delay) begin

	div_cnt <= div_cnt + 1'b1;
	
	if (dl_mlt == 4'd1) begin
		divider <= 1'b1;
	end

	if (dl_mlt == 4'd2) begin
		divider <= 8'd100;
	end
	
	if (dl_mlt == 4'd3) begin
		divider <= 20'd100000;
	end
		
	
	if (div_cnt >=	divider) begin
		div_cnt <= 1'b0;
		div_clk <= ~div_clk;
	end

end



always @(posedge div_clk) begin
		
		
		
		if (DL_launch == 1'b1) begin
			cnt1 <= cnt1 + 1'b1;
			DL_out <= 1'b1;
		end
		
		if (cnt1 >= delay) begin
			DL_out <= 1'b0;
			launch_PL <= 1'b1;
			End_Flg <= 1'b1;
		end	
		
		if (End_Flg == 1'b1) begin
			End_Flg <= 1'b0;
		end
		
		if (DL_launch == 1'b0) begin
			cnt1 <= 1'b0;
		   launch_PL <= 1'b0;	
		end
		
		
	
end




endmodule





