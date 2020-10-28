///////////////////////////////////////////////////////////
// Name File : main.v 												//
// Autor : Dyomkin Pavel Mikhailovich 							//
// Company : GSC RF TRINITI										//
// Description : The generator of optical clock pulses  	//
// Start design : 20.10.2020 										//
// Last revision : 28.10.2020 									//
///////////////////////////////////////////////////////////
module main (input clk, Rx, button,
				 output [7:0] d,     			//buffer reg
				 output [7:0] data,
				 output control_UART_clk,				
				 output [2:0] WR_ADDR,			// address for WRITE in RAM
				 output reg [2:0] RE_ADDR,		// address for READ from RAM
				 output reg RWR, CSR,			// Read flag
														// Write flag
				 output f							// Readiness byte to write on memory, 
														// 
				 );

initial RWR <= 1'b0;						// 1'b0 = READ, 1'b1 = WRITE			
initial CSR <= 1'b1;

reg [31:0] cnt;
reg o;
reg [2:0] ADDR_cnt_r;

always @(posedge clk) begin
	cnt <= cnt + 1'b1;
	if (cnt == 32'd50000000) begin
		cnt <= cnt - 32'd50000000;
		o <= ~o;
	end

end	
	
always @(posedge o) begin
	
	RWR <= 1'b1;
	RE_ADDR <= ADDR_cnt_r;
	ADDR_cnt_r <= ADDR_cnt_r + 1'b1;
	
	if (ADDR_cnt_r == 3'd7) begin
		ADDR_cnt_r <= ADDR_cnt_r - 3'd7;
	end

end	

UART_Rx (.clk_Rx(clk), .Rx_in(Rx), .data_out(d), .UART_clk(control_UART_clk), .wr(f), .wr_addr(WR_ADDR));

RAM (.RW(RWR), .in(d), .out(data), .clk_RAM(clk), .CS(f), .w_addr(WR_ADDR), .r_addr(RE_ADDR));

Pulse PL1(.clk_Pulse(clk));


//Pulse #(.q(50'd50000)) PL9(.clk_Pulse(clk));

//////  blink #(.q(50'd50000000)) bl1(.clk2(clk1), .i(a));	
endmodule					
					

/////// 