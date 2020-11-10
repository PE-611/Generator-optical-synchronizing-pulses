///////////////////////////////////////////////////////////
// Name File : main.v 												//
// Autor : Dyomkin Pavel Mikhailovich 							//
// Company : GSC RF TRINITI										//
// Description : The generator of optical clock pulses  	//
// Start design : 20.10.2020 										//
// Last revision : 28.10.2020 									//
///////////////////////////////////////////////////////////
module main (input clk, Rx, button,
				 output control_UART_clk,				
				 output reg o,						// STUFF 
				 output [7:0] led
				 );
				 
wire [7:0] WR_ADDR;								// address for WRITE in RAM
wire WRITE;											// Write flag readiness byte to write on memory 	
wire RE;
			 
wire [31:0] DRT;									// duration light pulse

wire [7:0] data_from_RAM;

wire [7:0] d;		 
wire [7:0] d_src;	
assign d_src = {d[0], d[1], d[2], d[3], d[4], d[5], d[6], d[7]}; //for inversion of bits in a byte (concatenation)

reg [31:0] cnt;
reg [7:0] ADDR_cnt_r;


reg start_flag;
initial start_flag <= 1'b0;

always @(posedge clk) begin


	if (button < 1'b1) begin
		start_flag <= 1'b1;
	end
	
	if (start_flag == 1'b1) begin
		cnt <= cnt + 1'b1;						// << anti bounce and MAX duration light pulse
		o <= 1'b1;
	end
	
	if (cnt == 32'd100000000) begin
		cnt <= 32'd0;
		start_flag <= 1'b0;
		o <= 1'b0;
	end
end

UART_Rx (.clk_Rx(clk), .Rx_in(Rx), .data_out(d), .UART_clk(control_UART_clk), .wr(WRITE), .wr_addr(WR_ADDR), .re(RE));


RAM (.read(RE), .in(d_src), .out(data_from_RAM), .clk_RAM(clk), .write(WRITE), 

.w_addr(WR_ADDR), .r_addr(RE_ADDR), .drt(DRT));


Pulse PL1(.clk_Pulse(clk), .duration(DRT), .out(led[0]), .start(o));




endmodule					














			
/*
always @(posedge clk) begin
	
	cnt <= cnt + 1'b1;
	if (cnt == 32'd100000000) begin
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


//Pulse #(.q(50'd50000)) PL9(.clk_Pulse(clk));

//////  blink #(.q(50'd50000000)) bl1(.clk2(clk1), .i(a));	