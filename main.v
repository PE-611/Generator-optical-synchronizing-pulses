///////////////////////////////////////////////////////////
// Name File : main.v 												//
// Autor : Dyomkin Pavel Mikhailovich 							//
// Company : GSC RF TRINITI										//
// Description : The generator of optical clock pulses  	//
// Start design : 20.10.2020 										//
// Last revision : 28.10.2020 									//
///////////////////////////////////////////////////////////
module main (input clk, Rx, button,
				 output o,						// STUFF 
				 output ex_1,
				 output ex_2,
				 output ex_3,
				 output ex_4,
				 output ex_5,
				 output ex_6,
				 output ex_7,
				 output ex_8
				 

				 );
				 
				 
				 
wire [7:0] WR_ADDR;								// address for WRITE in RAM
wire WRITE;											// Write flag readiness byte to write on memory 	
			 
wire [34:0] PL1_DRT;								
wire PL1_LAUNCH_DL1;
wire [34:0] DL1_DEL;
wire DL1_LAUNCH_PL2;
wire CH1TS;

wire [34:0] PL2_DRT;									
wire PL2_LAUNCH_DL2;
wire [34:0] DL2_DEL;
wire DL2_LAUNCH_PL3;
wire CH2TS;

wire [34:0] PL3_DRT;								
wire PL3_LAUNCH_DL3;
wire [34:0] DL3_DEL;
wire DL3_LAUNCH_PL4;
wire CH3TS;

wire [34:0] PL4_DRT;								
wire PL4_LAUNCH_DL4;
wire [34:0] DL4_DEL;
wire DL4_LAUNCH_PL5;
wire CH4TS;

wire [34:0] PL5_DRT;								
wire PL5_LAUNCH_DL5;
wire [34:0] DL5_DEL;
wire DL5_LAUNCH_PL6;
wire CH5TS;

wire [34:0] PL6_DRT;								
wire PL6_LAUNCH_DL6;
wire [34:0] DL6_DEL;
wire DL6_LAUNCH_PL7;
wire CH6TS;

wire [34:0] PL7_DRT;								
wire PL7_LAUNCH_DL7;
wire [34:0] DL7_DEL;
wire DL7_LAUNCH_PL8;
wire CH7TS;

wire [34:0] PL8_DRT;								
wire PL8_LAUNCH_DL8;
wire [34:0] DL8_DEL;
wire DL8_LAUNCH_PL9;
wire CH8TS;

wire [34:0] PL9_DRT;								
wire PL9_LAUNCH_DL9;
wire [34:0] DL9_DEL;
wire DL9_LAUNCH_PL10;
wire CH9TS;

wire [34:0] PL10_DRT;									
wire PL10_LAUNCH_DL10;
wire [34:0] DL10_DEL;
wire DL10_LAUNCH_PL11;
wire CH10TS;

wire [34:0] PL11_DRT;								
wire PL11_LAUNCH_DL11;
wire [34:0] DL11_DEL;
wire DL11_LAUNCH_PL12;
wire CH11TS;

wire [34:0] PL12_DRT;								
wire PL12_LAUNCH_DL12;
wire [34:0] DL12_DEL;
wire DL12_LAUNCH_PL13;
wire CH12TS;

wire [34:0] PL13_DRT;								
wire PL13_LAUNCH_DL13;
wire [34:0] DL13_DEL;
wire DL13_LAUNCH_PL14;
wire CH13TS;

wire [34:0] PL14_DRT;								
wire PL14_LAUNCH_DL14;
wire [34:0] DL14_DEL;
wire DL14_LAUNCH_PL15;
wire CH14TS;

wire [34:0] PL15_DRT;								
wire PL15_LAUNCH_DL15;
wire [34:0] DL15_DEL;
wire DL15_LAUNCH_PL16;
wire CH15TS;

wire [34:0] PL16_DRT;								
wire PL16_LAUNCH_DL16;
wire [34:0] DL16_DEL;
wire DL16_LAUNCH_PL17;
wire CH16TS;


//wire [7:0] data_from_RAM;

wire [7:0] d;										// Data from UART Rx		 
wire [7:0] d_src;									// Buff reg for nversion of bits in a receive byte
assign d_src = {d[0], d[1], d[2], d[3], d[4], d[5], d[6], d[7]}; //for inversion of bits in a byte (concatenation)




Start (.st_clk(clk), .st_button(button), .st_o(o));


UART_Rx (.clk_Rx(clk), .Rx_in(Rx), .data_out(d), .UART_clk(control_UART_clk), .wr(WRITE), .wr_addr(WR_ADDR));


RAM (.in(d_src), .clk_RAM(clk), .write(WRITE), .w_addr(WR_ADDR), //.out(data_from_RAM), 

.PL1_drt(PL1_DRT), .DL1_del(DL1_DEL), .ch1_type_start(CH1TS),
.PL2_drt(PL2_DRT), .DL2_del(DL2_DEL), .ch2_type_start(CH2TS),

.PL3_drt(PL3_DRT), .DL3_del(DL3_DEL), .ch3_type_start(CH3TS),
.PL4_drt(PL4_DRT), .DL4_del(DL4_DEL), .ch4_type_start(CH4TS),

.PL5_drt(PL5_DRT), .DL5_del(DL5_DEL), .ch5_type_start(CH5TS),
.PL6_drt(PL6_DRT), .DL6_del(DL6_DEL), .ch6_type_start(CH6TS),

.PL7_drt(PL7_DRT), .DL7_del(DL7_DEL), .ch7_type_start(CH7TS),
.PL8_drt(PL8_DRT), .DL8_del(DL8_DEL), .ch8_type_start(CH8TS)

);





Pulse PL1 (.clk_Pulse(clk), .duration(PL1_DRT), .PL_out(ex_1), .PL_start(o), .launch_DL(PL1_LAUNCH_DL1), .CHTS(CH1TS));
Delay DL1 (.clk_Delay(clk), .delay(DL1_DEL), .DL_launch(PL1_LAUNCH_DL1), .launch_PL(DL1_LAUNCH_PL2));  // .DL_out(ex[]), 



Pulse PL2 (.clk_Pulse(clk), .duration(PL2_DRT), .PL_out(ex_2), .PL_start(o), .PL_launch(DL1_LAUNCH_PL2),  .launch_DL(PL2_LAUNCH_DL2), .CHTS(CH2TS));
Delay DL2 (.clk_Delay(clk), .delay(DL2_DEL), .DL_launch(PL2_LAUNCH_DL2),  .launch_PL(DL2_LAUNCH_PL3)); // .DL_out(ex[]),



Pulse PL3 (.clk_Pulse(clk), .duration(PL3_DRT), .PL_out(ex_3), .PL_start(o), .PL_launch(DL2_LAUNCH_PL3),  .launch_DL(PL3_LAUNCH_DL3), .CHTS(CH3TS));
Delay DL3 (.clk_Delay(clk), .delay(DL3_DEL), .DL_launch(PL3_LAUNCH_DL3),  .launch_PL(DL3_LAUNCH_PL4)); // .DL_out(ex[]),



Pulse PL4 (.clk_Pulse(clk), .duration(PL4_DRT), .PL_out(ex_4), .PL_start(o), .PL_launch(DL3_LAUNCH_PL4),  .launch_DL(PL4_LAUNCH_DL4), .CHTS(CH4TS));
Delay DL4 (.clk_Delay(clk), .delay(DL4_DEL), .DL_launch(PL4_LAUNCH_DL4),  .launch_PL(DL4_LAUNCH_PL5)); // .DL_out(ex[]),



Pulse PL5 (.clk_Pulse(clk), .duration(PL5_DRT), .PL_out(ex_5), .PL_start(o), .PL_launch(DL4_LAUNCH_PL5),  .launch_DL(PL5_LAUNCH_DL5), .CHTS(CH5TS));
Delay DL5 (.clk_Delay(clk), .delay(DL5_DEL), .DL_launch(PL5_LAUNCH_DL5),  .launch_PL(DL5_LAUNCH_PL6)); // .DL_out(ex[]),


Pulse PL6 (.clk_Pulse(clk), .duration(PL6_DRT), .PL_out(ex_6), .PL_start(o), .PL_launch(DL5_LAUNCH_PL6),  .launch_DL(PL6_LAUNCH_DL6), .CHTS(CH6TS));
Delay DL6 (.clk_Delay(clk), .delay(DL6_DEL), .DL_launch(PL6_LAUNCH_DL6),  .launch_PL(DL6_LAUNCH_PL7)); // .DL_out(ex[]),


Pulse PL7 (.clk_Pulse(clk), .duration(PL7_DRT), .PL_out(ex_7), .PL_start(o), .PL_launch(DL6_LAUNCH_PL7),  .launch_DL(PL7_LAUNCH_DL7), .CHTS(CH7TS));
Delay DL7 (.clk_Delay(clk), .delay(DL7_DEL), .DL_launch(PL7_LAUNCH_DL7),  .launch_PL(DL7_LAUNCH_PL8)); // .DL_out(ex[]),


Pulse PL8 (.clk_Pulse(clk), .duration(PL8_DRT), .PL_out(ex_8), .PL_start(o), .PL_launch(DL7_LAUNCH_PL8),  .launch_DL(PL8_LAUNCH_DL8), .CHTS(CH8TS));
Delay DL8 (.clk_Delay(clk), .delay(DL8_DEL), .DL_launch(PL8_LAUNCH_DL8),  .launch_PL(DL8_LAUNCH_PL9)); // .DL_out(ex[]),

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