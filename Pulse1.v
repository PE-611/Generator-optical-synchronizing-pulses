///////////////////////////////////////////////////////////
// Name File : Pulse.v 												//
// Autor : Dyomkin Pavel Mikhailovich 							//
// Company : GSC RF TRINITI										//
// Description : The generator of a single pulse		  	//
// Start design : 28.10.2020 										//
// Last revision : 28.10.2020 									//
///////////////////////////////////////////////////////////
module Pulse( input clk_Pulse, start,
				  input [31:0] duration, 
				  output reg out, 
				  output reg [2:0] Read_pl, 
				  output reg RW_PL
				);
				
reg [31:0] cnt1;
initial cnt1 <= 30'd0;
initial out <= 1'b0;

reg [1:0] cnt_addr_pl;
initial cnt_addr_pl <= 2'd0;


always @(posedge clk_Pulse) begin
		
		
		
		if (start == 1'b1) begin
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





