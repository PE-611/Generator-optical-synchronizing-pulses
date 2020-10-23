///////////////////////////////////////////////////////////
// Name File : UART_Rx.v 											//
// Autor : Dyomkin Pavel Mikhailovich 							//
// Company : GSC RF TRINITI										//
// Description : UART Rx module								  	//
// Start design : 20.10.2020 										//
// Last revision : 20.10.2020 									//
///////////////////////////////////////////////////////////
module UART_Rx (input clk_Rx, Rx_in,                     
					 output reg [7:0] data_out, 
					 output reg i,				//for generation and checking UART_clk
					 output reg r				// Readiness byte to write on memory
					 );
					 
parameter Fclk = 100 * 1000000;			// Input clk [Hz]
parameter Fuart = 9600;						// recomended 230400, 115200, 57600, 38400, 33600, 28800, 19200, 14400, 9600, 1200.   		 	
parameter divider	= (Fclk / (Fuart *2)) - 1;		

initial r <= 1'b0;
					 
initial data_out <= 8'b00000000;
initial i <= 1'b0;	
										
reg [15:0]	cnt;
initial cnt <= 16'd0;				


	always @(posedge clk_Rx) begin
		cnt <= cnt + 1'b1;
		if (cnt == divider) begin		   // generation UART_clk Hz.
		cnt <= cnt - divider;
		i <= ~i;									// UART clk
		end
	end
					
reg l;											// receive flag
initial l <= 1'b0;
reg [2:0] g;									// counter of the bits for recieve (8 bit)
					
	always @(posedge i) begin				// 
			
		if (Rx_in == 1'b0) begin				// detector of the UART start bit
			l <= 1'b1;							// set receive flag 
			r <= 1'b1;
		end
						
		if (l == 1'b1) begin					// if and while the flag = 1, we write receive bits in bits in shift reg
			data_out <=  {data_out[7:0], Rx_in};
			g <= g + 1'b1;
		end
		
		if (g == 3'd7) begin				   // if number of the bits for recieve == 8, we ->
			l <= ~l;								// -> reset receive flag, ->
			g <= g - 3'd7;						// -> clear counter of the bits for recieve and ->
			r <= 1'b0;
		end
		
		
		
		
		
		
		
end
		
endmodule