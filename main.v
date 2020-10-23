///////////////////////////////////////////////////////////
// Name File : main.v 												//
// Autor : Dyomkin Pavel Mikhailovich 							//
// Company : GSC RF TRINITI										//
// Description : The generator of optical clock pulses  	//
// Start design : 20.10.2020 										//
// Last revision : 20.10.2020 									//
///////////////////////////////////////////////////////////
module main (input clk, Rx, 
				 output [7:0] d,     //buffer reg
				 output [7:0] data,
				 output j,				// control UART_clk
				 output reg ADDR,		// address in RAM
				 output reg RWR,		// Read/write flag
				 output f				// Readiness byte to write on memory, 
											// if f == 1'b0 byte will be receved, if f == 1'b1, the process of receiving bytes
				
				);

initial RWR <= 1'b0; // 1'b0 = READ, 1'b1 = WRITE			
				
always @(posedge clk) begin				
	
	if (f == 1'b0) begin 
	ADDR <= 4'd0;
	RWR <= 1'b0;     ///read
	
	
	
	end
	
	
	if (f == 1'b1) begin 
		ADDR <= 4'd0;
		RWR <= 1'b1;	/// write
		
	
		
	end
	
	
end
	

UART_Rx (.clk_Rx(clk), .Rx_in(Rx), .data_out(d), .i(j), .r(f));

RAM (.RW(RWR), .in(d), .addr(ADDR), .out(data), .clk_RAM(clk));
	
endmodule					
					

/////// 