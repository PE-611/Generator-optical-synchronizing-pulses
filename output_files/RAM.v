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
			  input write
			  
			  );

reg read;
initial read <= 1'b1;			  
reg [7:0] DATA [111:0];

initial begin

end



always @(posedge clk_RAM) begin
	
	if(write == 1'b0) begin											//write if == 1'b0 else prohibition on write
		DATA[w_addr]=in;
		
	end
	
	if (read == 1'b1) begin
		drt <= DATA[0];		// READ if == 1'b1 else prohibition on read
	end	
	
	
	


	
end

	
endmodule
