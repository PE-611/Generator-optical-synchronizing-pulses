///////////////////////////////////////////////////////////
// Name File : RAM.v 												//
// Autor : Dyomkin Pavel Mikhailovich 							//
// Company : GSC RF TRINITI										//
// Description : UART Rx module								  	//
// Start design : 22.10.2020 										//
// Last revision : 27.10.2020 									//
///////////////////////////////////////////////////////////
module RAM(output reg [31:0] out, output reg [31:0] drt,
			  input clk_RAM,
			  input [7:0] in,
			  input [7:0] w_addr,
			  input [7:0] r_addr,
			  input read, write
			  
			  );

			  
reg [7:0] DATA [31:0];

initial begin
DATA[0] = 8'd0; //DATA[8] = 8'd0;  DATA[16] = 8'd0; DATA[24] = 8'd0; 
DATA[1] = 8'd0; //DATA[9] = 8'd0;  DATA[17] = 8'd0; DATA[25] = 8'd0; 
DATA[2] = 8'd0; //DATA[10] = 8'd0; DATA[18] = 8'd0; DATA[26] = 8'd0; 
DATA[3] = 8'd0; //DATA[11] = 8'd0; DATA[19] = 8'd0; DATA[27] = 8'd0; 
DATA[4] = 8'd0; //DATA[12] = 8'd0; DATA[20] = 8'd0; DATA[28] = 8'd0; 
DATA[5] = 8'd0; //DATA[13] = 8'd0; DATA[21] = 8'd0; DATA[29] = 8'd0; 
DATA[6] = 8'd0; //DATA[14] = 8'd0; DATA[22] = 8'd0; DATA[30] = 8'd0; 
DATA[7] = 8'd0; //DATA[15] = 8'd0; DATA[31] = 8'd0; DATA[31] = 8'd0; 
end



always @(posedge clk_RAM) begin
	
	if(write == 1'b0) begin											//write if == 1'b0 else prohibition on write
		DATA[w_addr]=in;
		
	end
	
	if (read == 1'b1) begin
		drt <= DATA[7] * DATA[6] * DATA[5] * DATA[4];		// READ
	end	
	
	
	


	
end

	
endmodule
