///////////////////////////////////////////////////////////
// Name File : RAM.v 												//
// Autor : Dyomkin Pavel Mikhailovich 							//
// Company : GSC RF TRINITI										//
// Description : UART Rx module								  	//
// Start design : 22.10.2020 										//
// Last revision : 27.10.2020 									//
///////////////////////////////////////////////////////////
module RAM(output reg [7:0] out,
			  input clk_RAM,
			  input [7:0] in,
			  input [2:0] w_addr,
			  input [2:0] r_addr,
			  input RW, CS);

reg [7:0] DATA[7:0];

initial begin
DATA[0] = 8'd0;
DATA[1] = 8'd0;
DATA[2] = 8'd0;
DATA[3] = 8'd0;
DATA[4] = 8'd0;
DATA[5] = 8'd0;
DATA[6] = 8'd0;
DATA[7] = 8'd0;
end


always @(posedge clk_RAM) begin
	
	if(CS == 1'b0) begin											//WRITE
		DATA[w_addr]=in;
	end
	
	if (RW == 1'b1) begin
		out <= DATA[r_addr];										// READ
	end	
	
		
end

	
endmodule
