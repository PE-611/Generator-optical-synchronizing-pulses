///////////////////////////////////////////////////////////
// Name File : main.v 												//
// Autor : Dyomkin Pavel Mikhailovich 							//
// Company : GSC RF TRINITI										//
// Description : The generator of optical clock pulses  	//
// Start design : 20.10.2020 										//
// Last revision : 28.10.2020 									//
///////////////////////////////////////////////////////////
module main (input clk, Rx, button,
				 output control_UART_clk, DL1_LAUNCH_PL2, PL1_LAUNCH_DL1,				
				 output o,						// STUFF 
				 output [7:0] ex
				 );
				 
				 
				 
wire [7:0] WR_ADDR;								// address for WRITE in RAM
wire WRITE;											// Write flag readiness byte to write on memory 	
			 
wire [35:0] PL1_DRT;									// duration light pulse
//wire PL1_LAUNCH_DL1;
wire [35:0] DL1_DEL;
//wire DL1_LAUNCH_PL2;
wire [3:0] CH1TS;

wire [35:0] PL2_DRT;									// duration light pulse
wire PL2_LAUNCH_DL2;
wire [35:0] DL2_DEL;
wire DL2_LAUNCH_PL3;
wire [3:0] CH2TS;





wire [7:0] data_from_RAM;

wire [7:0] d;										// Data from UART Rx		 
wire [7:0] d_src;									// Buff reg for nversion of bits in a receive byte
assign d_src = {d[0], d[1], d[2], d[3], d[4], d[5], d[6], d[7]}; //for inversion of bits in a byte (concatenation)




Start (.st_clk(clk), .st_button(button), .st_o(o));


UART_Rx (.clk_Rx(clk), .Rx_in(Rx), .data_out(d), .UART_clk(control_UART_clk), .wr(WRITE), .wr_addr(WR_ADDR));


RAM (.in(d_src), .out(data_from_RAM), .clk_RAM(clk), .write(WRITE), .w_addr(WR_ADDR), 

.PL1_drt(PL1_DRT), .DL1_del(DL1_DEL), .ch1_type_start(CH1TS),
.PL2_drt(PL2_DRT), .DL2_del(DL2_DEL), .ch2_type_start(CH2TS)
);



Pulse_CH1 (.clk_Pulse(clk), .duration(PL1_DRT), .PL_out(ex[0]), .PL_start(o), .launch_DL(PL1_LAUNCH_DL1), .CHTS(CH1TS));
Delay_CH1 (.clk_Delay(clk), .delay(DL1_DEL), .DL_launch(PL1_LAUNCH_DL1), .DL_out(ex[1]), .launch_PL(DL1_LAUNCH_PL2)); 



Pulse_CH2(.clk_Pulse(clk), .duration(PL2_DRT), .PL_out(ex[2]), .PL_start(o), .PL_launch(DL1_LAUNCH_PL2),  .launch_DL(PL2_LAUNCH_DL2), .CHTS(CH2TS));
Delay_CH2 (.clk_Delay(clk), .delay(DL2_DEL), .DL_launch(PL2_LAUNCH_DL2), .DL_out(ex[3]), .launch_PL(DL2_LAUNCH_PL3)); 



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