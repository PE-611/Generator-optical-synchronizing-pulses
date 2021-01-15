///////////////////////////////////////////////////////////
// Name File : UART_Rx.v 											//
// Autor : Dyomkin Pavel Mikhailovich 							//
// Company : GSC RF TRINITI										//
// Description : UART Rx module								  	//
// Start design : 20.10.2020 										//
// Last revision : 28.10.2020 									//
///////////////////////////////////////////////////////////
module UART_Rx (input clk_Rx, Rx_in, 
					 output reg [7:0] data_out, 
					 output reg UART_clk,	//for generation and checking UART_clk
					 output reg wr,				// Readiness byte to write on memory
					 output reg [7:0] wr_addr

					 );
					 
parameter Fclk = 100 * 1000000;			// Input clk [Hz]
parameter Fuart = 115200;						// recomended 230400, 115200, 57600, 38400, 33600, 28800, 19200, 14400, 9600, 1200.   		 	
parameter divider	= (Fclk / (Fuart *2)) - 1; 		

initial wr <= 1'b1;
initial wr_addr <= 8'd112;          ///////////////
					 
initial data_out <= 8'b00000000;
initial UART_clk <= 1'b0;	
										
reg [15:0]	cnt;
initial cnt <= 16'd0;				




	always @(posedge clk_Rx) begin
		cnt <= cnt + 1'b1;
		if (cnt == divider) begin		   // generation UART_clk Hz.
			cnt <= cnt - divider;
			UART_clk <= ~UART_clk;				// UART clk
		end
	end
					
reg l;											// receive flag
initial l <= 1'b0;
reg [2:0] g;									// counter of the bits for recieve (8 bit)
initial g = 1'b0;
					
	always @(posedge UART_clk) begin				 
		
	
			
		if (Rx_in == 1'b0) begin			// detector of the UART start bit
			l <= 1'b1;							// set receive flag 
			wr <= 1'b1;							// prohibition on write
		end
						
		if (l == 1'b1) begin					// if and while the flag = 1, we write receive bits in bits in shift reg data_out
			data_out <=  {data_out[7:0], Rx_in};
			g <= g + 1'b1;
			wr <= 1'b1;							// prohibition on write
		end
		
		if (g == 3'd7) begin				   // if number of the bits for recieve == 8, we ->
			l <= 1'b0;								// -> reset receive flag, ->
			g <= 1'b0;						   // -> clear counter of the bits for recieve and ->
			wr <= 1'b0;							// permission on write
			wr_addr <= wr_addr - 1'b1;
		end
		
		if (wr_addr == 8'd0) begin			// quantity bytes = 112;
			wr_addr <= 8'd112;
			wr <= 1'b1;							// prohibition on write
			
		end
		
		
end
		
endmodule
