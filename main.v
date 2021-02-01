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
				 //output ex_9,
				 //output ex_10,
				 //output ex_11,
				 //output ex_12,
				 //output ex_13,
				 //output ex_14,
				 //output ex_15,
				 //output ex_16,
				 //output CLK, DIV_CLK//
				 );
				 
wire PC_START;
wire CLK;
wire END_FLG;		
wire DIN;
wire [7:0] WR_ADDR;								// address for WRITE in RAM
wire WRITE;											// Write flag readiness byte to write on memory 	
			 
wire [17:0] PL1_DRT;								
wire PL1_LAUNCH_DL1;
wire [16:0] DL1_DEL;
wire DL1_LAUNCH_PL2;
wire [3:0] CH1TS;
wire [4:0] MULT_PL1;
wire [4:0] MULT_DL1;

wire [16:0] PL2_DRT;									
wire PL2_LAUNCH_DL2;
wire [16:0] DL2_DEL;
wire DL2_LAUNCH_PL3;
wire [7:0]CH2TS;
wire [4:0] MULT_PL2;
wire [4:0] MULT_DL2;

wire [16:0] PL3_DRT;								
wire PL3_LAUNCH_DL3;
wire [16:0] DL3_DEL;
wire DL3_LAUNCH_PL4;
wire [3:0]CH3TS;
wire [4:0] MULT_PL3;
wire [4:0] MULT_DL3;

wire [16:0] PL4_DRT;								
wire PL4_LAUNCH_DL4;
wire [16:0] DL4_DEL;
wire DL4_LAUNCH_PL5;
wire [3:0]CH4TS;
wire [4:0] MULT_PL4;
wire [4:0] MULT_DL4;

wire [16:0] PL5_DRT;								
wire PL5_LAUNCH_DL5;
wire [16:0] DL5_DEL;
wire DL5_LAUNCH_PL6;
wire [3:0]CH5TS;
wire [4:0] MULT_PL5;
wire [4:0] MULT_DL5;

wire [16:0] PL6_DRT;								
wire PL6_LAUNCH_DL6;
wire [16:0] DL6_DEL;
wire DL6_LAUNCH_PL7;
wire [3:0]CH6TS;
wire [4:0] MULT_PL6;
wire [4:0] MULT_DL6;

wire [16:0] PL7_DRT;								
wire PL7_LAUNCH_DL7;
wire [16:0] DL7_DEL;
wire DL7_LAUNCH_PL8;
wire [3:0]CH7TS;
wire [4:0] MULT_PL7;
wire [4:0] MULT_DL7;

wire [16:0] PL8_DRT;								
wire PL8_LAUNCH_DL8;
wire [16:0] DL8_DEL;
wire DL8_LAUNCH_PL9;
wire [3:0]CH8TS;
wire [4:0] MULT_PL8;
wire [4:0] MULT_DL8;

wire [16:0] PL9_DRT;								
wire PL9_LAUNCH_DL9;
wire [16:0] DL9_DEL;
wire DL9_LAUNCH_PL10;
wire [3:0]CH9TS;
wire [4:0] MULT_PL9;
wire [4:0] MULT_DL9;

wire [16:0] PL10_DRT;									
wire PL10_LAUNCH_DL10;
wire [16:0] DL10_DEL;
wire DL10_LAUNCH_PL11;
wire [3:0]CH10TS;
wire [4:0] MULT_PL10;
wire [4:0] MULT_DL10;

wire [16:0] PL11_DRT;								
wire PL11_LAUNCH_DL11;
wire [16:0] DL11_DEL;
wire DL11_LAUNCH_PL12;
wire [3:0]CH11TS;
wire [4:0] MULT_PL11;
wire [4:0] MULT_DL11;

wire [16:0] PL12_DRT;								
wire PL12_LAUNCH_DL12;
wire [16:0] DL12_DEL;
wire DL12_LAUNCH_PL13;
wire [3:0]CH12TS;
wire [4:0] MULT_PL12;
wire [4:0] MULT_DL12;

wire [16:0] PL13_DRT;								
wire PL13_LAUNCH_DL13;
wire [16:0] DL13_DEL;
wire DL13_LAUNCH_PL14;
wire [3:0]CH13TS;
wire [4:0] MULT_PL13;
wire [4:0] MULT_DL13;

wire [16:0] PL14_DRT;								
wire PL14_LAUNCH_DL14;
wire [16:0] DL14_DEL;
wire DL14_LAUNCH_PL15;
wire [3:0]CH14TS;
wire [4:0] MULT_PL14;
wire [4:0] MULT_DL14;

wire [16:0] PL15_DRT;								
wire PL15_LAUNCH_DL15;
wire [16:0] DL15_DEL;
wire DL15_LAUNCH_PL16;
wire [3:0]CH15TS;
wire [4:0] MULT_PL15;
wire [4:0] MULT_DL15;

wire [16:0] PL16_DRT;								
wire PL16_LAUNCH_DL16;
wire [16:0] DL16_DEL;
wire DL16_LAUNCH_PL17;
wire [3:0]CH16TS;
wire [4:0] MULT_PL16;
wire [4:0] MULT_DL16;


//wire [7:0] data_from_RAM;

wire [7:0] d;										// Data from UART Rx		 
wire [7:0] d_src;									// Buff reg for nversion of bits in a receive byte
assign d_src = {d[0], d[1], d[2], d[3], d[4], d[5], d[6], d[7]}; //for inversion of bits in a byte (concatenation)



PLL pll_inst (.inclk0(clk), .c0(CLK));	

Start (.st_clk(CLK), .st_button(button), .st_o(o), .end_flg(END_FLG), .PC_start(PC_START)); //.ready_to_start(READY_TO_START),
				   ///

UART_Rx (.clk_Rx(clk), .Rx_in(Rx), .data_out(d), .UART_clk(control_UART_clk), .wr(WRITE), .wr_addr(WR_ADDR));//, .PC_start(PC_START));


RAM (.in(d_src), .clk_RAM(clk), .write(WRITE), .w_addr(WR_ADDR), .pc_start(PC_START), //.out(data_from_RAM), 

.PL1_drt(PL1_DRT), .DL1_del(DL1_DEL), .ch1_type_start(CH1TS), .Mult_PL1(MULT_PL1), .Mult_DL1(MULT_DL1), 
.PL2_drt(PL2_DRT), .DL2_del(DL2_DEL), .ch2_type_start(CH2TS), .Mult_PL2(MULT_PL2), .Mult_DL2(MULT_DL2),

.PL3_drt(PL3_DRT), .DL3_del(DL3_DEL), .ch3_type_start(CH3TS), .Mult_PL3(MULT_PL3), .Mult_DL3(MULT_DL3),
.PL4_drt(PL4_DRT), .DL4_del(DL4_DEL), .ch4_type_start(CH4TS), .Mult_PL4(MULT_PL4), .Mult_DL4(MULT_DL4),

.PL5_drt(PL5_DRT), .DL5_del(DL5_DEL), .ch5_type_start(CH5TS), .Mult_PL5(MULT_PL5), .Mult_DL5(MULT_DL5),
.PL6_drt(PL6_DRT), .DL6_del(DL6_DEL), .ch6_type_start(CH6TS), .Mult_PL6(MULT_PL6), .Mult_DL6(MULT_DL6),

.PL7_drt(PL7_DRT), .DL7_del(DL7_DEL), .ch7_type_start(CH7TS), .Mult_PL7(MULT_PL7), .Mult_DL7(MULT_DL7),
.PL8_drt(PL8_DRT), .DL8_del(DL8_DEL), .ch8_type_start(CH8TS), .Mult_PL8(MULT_PL8), .Mult_DL8(MULT_DL8)

);





Pulse PL1 (.clk_Pulse(CLK), .duration(PL1_DRT), .PL_out(ex_1), .PL_start(o), .launch_DL(PL1_LAUNCH_DL1), .CHTS(CH1TS), .pl_mlt(MULT_PL1), .div_clk(DIV_CLK));
Delay DL1 (.clk_Delay(CLK), .delay(DL1_DEL), .DL_launch(PL1_LAUNCH_DL1), .launch_PL(DL1_LAUNCH_PL2), .dl_mlt(MULT_DL1));  // .DL_out(ex[]), 



Pulse PL2 (.clk_Pulse(CLK), .duration(PL2_DRT), .PL_out(ex_2), .PL_start(o), .PL_launch(DL1_LAUNCH_PL2),  .launch_DL(PL2_LAUNCH_DL2), .CHTS(CH2TS), .pl_mlt(MULT_PL2));
Delay DL2 (.clk_Delay(CLK), .delay(DL2_DEL), .DL_launch(PL2_LAUNCH_DL2),  .launch_PL(DL2_LAUNCH_PL3), .dl_mlt(MULT_DL2)); // .DL_out(ex[]),



Pulse PL3 (.clk_Pulse(CLK), .duration(PL3_DRT), .PL_out(ex_3), .PL_start(o), .PL_launch(DL2_LAUNCH_PL3),  .launch_DL(PL3_LAUNCH_DL3), .CHTS(CH3TS), .pl_mlt(MULT_PL3));
Delay DL3 (.clk_Delay(CLK), .delay(DL3_DEL), .DL_launch(PL3_LAUNCH_DL3),  .launch_PL(DL3_LAUNCH_PL4), .dl_mlt(MULT_DL3)); // .DL_out(ex[]),


Pulse PL4 (.clk_Pulse(CLK), .duration(PL4_DRT), .PL_out(ex_4), .PL_start(o), .PL_launch(DL3_LAUNCH_PL4),  .launch_DL(PL4_LAUNCH_DL4), .CHTS(CH4TS), .pl_mlt(MULT_PL4));
Delay DL4 (.clk_Delay(CLK), .delay(DL4_DEL), .DL_launch(PL4_LAUNCH_DL4),  .launch_PL(DL4_LAUNCH_PL5), .dl_mlt(MULT_DL4)); // .DL_out(ex[]),



Pulse PL5 (.clk_Pulse(CLK), .duration(PL5_DRT), .PL_out(ex_5), .PL_start(o), .PL_launch(DL4_LAUNCH_PL5),  .launch_DL(PL5_LAUNCH_DL5), .CHTS(CH5TS), .pl_mlt(MULT_PL5));
Delay DL5 (.clk_Delay(CLK), .delay(DL5_DEL), .DL_launch(PL5_LAUNCH_DL5),  .launch_PL(DL5_LAUNCH_PL6), .dl_mlt(MULT_DL5)); // .DL_out(ex[]),



Pulse PL6 (.clk_Pulse(CLK), .duration(PL6_DRT), .PL_out(ex_6), .PL_start(o), .PL_launch(DL5_LAUNCH_PL6),  .launch_DL(PL6_LAUNCH_DL6), .CHTS(CH6TS), .pl_mlt(MULT_PL6));
Delay DL6 (.clk_Delay(CLK), .delay(DL6_DEL), .DL_launch(PL6_LAUNCH_DL6),  .launch_PL(DL6_LAUNCH_PL7), .dl_mlt(MULT_DL6)); // .DL_out(ex[]),



Pulse PL7 (.clk_Pulse(CLK), .duration(PL7_DRT), .PL_out(ex_7), .PL_start(o), .PL_launch(DL6_LAUNCH_PL7),  .launch_DL(PL7_LAUNCH_DL7), .CHTS(CH7TS), .pl_mlt(MULT_PL7));
Delay DL7 (.clk_Delay(CLK), .delay(DL7_DEL), .DL_launch(PL7_LAUNCH_DL7),  .launch_PL(DL7_LAUNCH_PL8), .dl_mlt(MULT_DL7)); // .DL_out(ex[]),



Pulse PL8 (.clk_Pulse(CLK), .duration(PL8_DRT), .PL_out(ex_8), .PL_start(o), .PL_launch(DL7_LAUNCH_PL8),  .launch_DL(PL8_LAUNCH_DL8), .CHTS(CH8TS), .pl_mlt(MULT_PL8));
Delay DL8 (.clk_Delay(CLK), .delay(DL8_DEL), .DL_launch(PL8_LAUNCH_DL8),  .launch_PL(DL8_LAUNCH_PL9), .dl_mlt(MULT_DL8), .End_Flg (DIN)); // .DL_out(ex[]),

DLST ST1(.clk_dlst(clk), .din(DIN), .dout(END_FLG));



endmodule					

