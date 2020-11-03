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
				 output wire [7:0] d_src,
				 output [31:0] data,
				 output control_UART_clk,				
				 output [2:0] WR_ADDR,			// address for WRITE in RAM
				 
														// Write flag
				 output WRITE,							// Readiness byte to write on memory, 
				 output reg o,						// 
				 output PL,
				 output [31:0] DRT
				 );

assign d_src = {d[0], d[1], d[2], d[3], d[4], d[5], d[6], d[7]};
				 
		

reg [31:0] cnt;
//reg o;
reg [2:0] ADDR_cnt_r;

always @(posedge clk) begin
	
	cnt <= cnt + 1'b1;
	if (cnt == 32'd1000000) begin
		cnt <= 32'd0;
		o <= ~o;
	end

end	
/*	
always @(posedge o) begin
	
	RWR <= 1'b1;
	RE_ADDR <= ADDR_cnt_r;
	ADDR_cnt_r <= ADDR_cnt_r + 1'b1;
	
	if (ADDR_cnt_r == 3'd7) begin
		ADDR_cnt_r <= 3'd0;
	end

end	
*/
UART_Rx (.clk_Rx(clk), .Rx_in(Rx), .data_out(d), .UART_clk(control_UART_clk), .wr(write), .wr_addr(WR_ADDR));

RAM (.read(RE), .in(d_src), .out(data), .clk_RAM(clk), .write(wr), .w_addr(WR_ADDR), .r_addr(RE_ADDR), .drt(DRT));

Pulse PL1(.clk_Pulse(clk), .duration(DRT), .out(PL), .start(o));


//Pulse #(.q(50'd50000)) PL9(.clk_Pulse(clk));

//////  blink #(.q(50'd50000000)) bl1(.clk2(clk1), .i(a));	
endmodule					
					

/////// 