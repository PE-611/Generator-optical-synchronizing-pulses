///////////////////////////////////////////////////////////
// Name File : RAM.v 												//
// Autor : Dyomkin Pavel Mikhailovich 							//
// Company : GSC RF TRINITI										//
// Description : UART Rx module								  	//
// Start design : 22.10.2020 										//
// Last revision : 27.10.2020 									//
///////////////////////////////////////////////////////////

module RAM(//output reg [31:0] out, 

			  output reg [34:0] PL1_drt,
			  output reg [34:0] DL1_del,
			  output reg ch1_type_start,
			  
			  output reg [34:0] PL2_drt,
			  output reg [34:0] DL2_del,
			  output reg ch2_type_start,
			  
			  output reg [34:0] PL3_drt,
			  output reg [34:0] DL3_del,
			  output reg ch3_type_start,
			  
			  output reg [34:0] PL4_drt,
			  output reg [34:0] DL4_del,
			  output reg ch4_type_start,
			  
			  output reg [34:0] PL5_drt,
			  output reg [34:0] DL5_del,
			  output reg ch5_type_start,
			  
			  output reg [34:0] PL6_drt,
			  output reg [34:0] DL6_del,
			  output reg ch6_type_start,
			  
			  output reg [34:0] PL7_drt,
			  output reg [34:0] DL7_del,
			  output reg ch7_type_start,
			  
			  output reg [34:0] PL8_drt,
			  output reg [34:0] DL8_del,
			  output reg ch8_type_start,
			  
			  output reg [34:0] PL9_drt,
			  output reg [34:0] DL9_del,
			  output reg ch9_type_start,
			  
			  output reg [34:0] PL10_drt,
			  output reg [34:0] DL10_del,
			  output reg ch10_type_start,
			  
			  output reg [34:0] PL11_drt,
			  output reg [34:0] DL11_del,
			  output reg ch11_type_start,
			  
			  output reg [34:0] PL12_drt,
			  output reg [34:0] DL12_del,
			  output reg ch12_type_start,
			  
			  output reg [34:0] PL13_drt,
			  output reg [34:0] DL13_del,
			  output reg ch13_type_start,
			  
			  output reg [34:0] PL14_drt,
			  output reg [34:0] DL14_del,
			  output reg ch14_type_start,
			  
			  output reg [34:0] PL15_drt,
			  output reg [34:0] DL15_del,
			  output reg ch15_type_start,
			  
			  output reg [34:0] PL16_drt,
			  output reg [34:0] DL16_del,
			  output reg ch16_type_start,
			  
								
			  input clk_RAM,
			  input [7:0] in,
			  input [7:0] w_addr,
			  input write
			  
			  );

reg read;
initial read <= 1'b1;			  
reg [7:0] DATA [111:0]; 


reg ns;
reg [8:0] us;
reg [20:0] ms;
//reg [36:0] s;

initial ns <= 1'b1;
initial us <= 8'd100;
initial ms <= 20'd100000;
//initial s <= 36'd100000000;

initial begin

end



always @(posedge clk_RAM) begin
	
	if(write == 1'b0) begin											//write if == 1'b0 else prohibition on write
		DATA[w_addr]=in;
		
	end
	
	if (read == 1'b1) begin                               // Readiness flag always = 1, READ if == 1'b1 else prohibition on read
		
		
		
		
		if (DATA[109] == 7'd1) begin
			PL1_drt  <= {DATA[110], DATA[111]} * ns;
		end
		
		if (DATA[109] == 7'd2) begin
			PL1_drt  <= {DATA[110], DATA[111]} * us;
		end
		
		if (DATA[109] == 7'd3) begin
			PL1_drt  <= {DATA[110], DATA[111]} * ms;
		end
		
//		if (DATA[109] == 7'd4) begin
//			PL1_drt  <= {DATA[110], DATA[111]} * s;
//		end
		
		
		if (DATA[106] == 7'd1) begin
			DL1_del  <= {DATA[107], DATA[108]} * ns;
		end
		
		if (DATA[106] == 7'd2) begin
			DL1_del  <= {DATA[107], DATA[108]} * us;
		end
		
		if (DATA[106] == 7'd3) begin
			DL1_del  <= {DATA[107], DATA[108]} * ms;
		end
		
//		if (DATA[106] == 7'd4) begin
//			DL1_del  <= {DATA[107], DATA[108]} * s;
//		end
				
		ch1_type_start <= DATA[105];
		
		
		
		
		
		
		
		
		
		
		if (DATA[102] == 7'd1) begin
			PL2_drt  <= {DATA[103], DATA[104]} * ns;
		end
		
		if (DATA[102] == 7'd2) begin
			PL2_drt  <= {DATA[103], DATA[104]} * us;
		end
		
		if (DATA[102] == 7'd3) begin
			PL2_drt  <= {DATA[103], DATA[104]} * ms;
		end
		
//		if (DATA[102] == 7'd4) begin
//			PL2_drt  <= {DATA[103], DATA[104]} * s;
//		end
		
		
		if (DATA[99] == 7'd1) begin
			DL2_del  <= {DATA[100], DATA[101]} * ns;
		end
		
		if (DATA[99] == 7'd2) begin
			DL2_del  <= {DATA[100], DATA[101]} * us;
		end
		
		if (DATA[99] == 7'd3) begin
			DL2_del  <= {DATA[100], DATA[101]} * ms;
		end
		
//		if (DATA[99] == 7'd4) begin
//			DL2_del  <= {DATA[100], DATA[101]} * s;
//		end
				
		ch2_type_start <= DATA[98];
		
		
		
		
		
		
		
		
		
		
		if (DATA[95] == 7'd1) begin
			PL3_drt  <= {DATA[96], DATA[97]} * ns;
		end
		
		if (DATA[95] == 7'd2) begin
			PL3_drt  <= {DATA[96], DATA[97]} * us;
		end
		
		if (DATA[95] == 7'd3) begin
			PL3_drt  <= {DATA[96], DATA[97]} * ms;
		end
		
//		if (DATA[95] == 7'd4) begin
//			PL3_drt  <= {DATA[96], DATA[97]} * s;
//		end
		
		
		if (DATA[92] == 7'd1) begin
			DL3_del  <= {DATA[93], DATA[94]} * ns;
		end
		
		if (DATA[92] == 7'd2) begin
			DL3_del  <= {DATA[93], DATA[94]} * us;
		end
		
		if (DATA[92] == 7'd3) begin
			DL3_del  <= {DATA[93], DATA[94]} * ms;
		end
		
//		if (DATA[92] == 7'd4) begin
//			DL3_del  <= {DATA[93], DATA[94]} * s;
//		end
				
		ch3_type_start <= DATA[91];

		
		
		
		
		
		
		
		
		
		if (DATA[88] == 7'd1) begin
			PL4_drt  <= {DATA[89], DATA[90]} * ns;
		end
		
		if (DATA[88] == 7'd2) begin
			PL4_drt  <= {DATA[89], DATA[90]} * us;
		end
		
		if (DATA[88] == 7'd3) begin
			PL4_drt  <= {DATA[89], DATA[90]} * ms;
		end
		
//		if (DATA[88] == 7'd4) begin
//			PL4_drt  <= {DATA[89], DATA[90]} * s;
//		end
		
		
		if (DATA[85] == 7'd1) begin
			DL4_del  <= {DATA[86], DATA[87]} * ns;
		end
		
		if (DATA[85] == 7'd2) begin
			DL4_del  <= {DATA[86], DATA[87]} * us;
		end
		
		if (DATA[85] == 7'd3) begin
			DL4_del  <= {DATA[86], DATA[87]} * ms;
		end
		
//		if (DATA[85] == 7'd4) begin
//			DL4_del  <= {DATA[86], DATA[87]} * s;
//		end
				
		ch4_type_start <= DATA[84];
		
		
		
		
		
		
		
		
		
		
		if (DATA[81] == 7'd1) begin
			PL5_drt  <= {DATA[82], DATA[83]} * ns;
		end
		
		if (DATA[81] == 7'd2) begin
			PL5_drt  <= {DATA[82], DATA[83]} * us;
		end
		
		if (DATA[81] == 7'd3) begin
			PL5_drt  <= {DATA[82], DATA[83]} * ms;
		end
		
//		if (DATA[81] == 7'd4) begin
//			PL5_drt  <= {DATA[82], DATA[83]} * s;
//		end
		
		
		if (DATA[78] == 7'd1) begin
			DL5_del  <= {DATA[79], DATA[80]} * ns;
		end
		
		if (DATA[78] == 7'd2) begin
			DL5_del  <= {DATA[79], DATA[80]} * us;
		end
		
		if (DATA[78] == 7'd3) begin
			DL5_del  <= {DATA[79], DATA[80]} * ms;
		end
		
//		if (DATA[78] == 7'd4) begin
//			DL5_del  <= {DATA[79], DATA[80]} * s;
//		end
				
		ch5_type_start <= DATA[77];
	
	
	
	
	
	
	
	
	
	
		if (DATA[74] == 7'd1) begin
			PL6_drt  <= {DATA[75], DATA[76]} * ns;
		end
		
		if (DATA[74] == 7'd2) begin
			PL6_drt  <= {DATA[75], DATA[76]} * us;
		end
		
		if (DATA[74] == 7'd3) begin
			PL6_drt  <= {DATA[75], DATA[76]} * ms;
		end
		
//		if (DATA[74] == 7'd4) begin
//			PL6_drt  <= {DATA[75], DATA[76]} * s;
//		end
		
		
		if (DATA[71] == 7'd1) begin
			DL6_del  <= {DATA[72], DATA[73]} * ns;
		end
		
		if (DATA[71] == 7'd2) begin
			DL6_del  <= {DATA[72], DATA[73]} * us;
		end
		
		if (DATA[71] == 7'd3) begin
			DL6_del  <= {DATA[72], DATA[73]} * ms;
		end
		
//		if (DATA[71] == 7'd4) begin
//			DL6_del  <= {DATA[72], DATA[73]} * s;
//		end
				
		ch6_type_start <= DATA[70];
		
		
		
		
		
		
		
		
		
		
		if (DATA[67] == 7'd1) begin
			PL7_drt  <= {DATA[68], DATA[69]} * ns;
		end
		
		if (DATA[67] == 7'd2) begin
			PL7_drt  <= {DATA[68], DATA[69]} * us;
		end
		
		if (DATA[67] == 7'd3) begin
			PL7_drt  <= {DATA[68], DATA[69]} * ms;
		end
		
//		if (DATA[67] == 7'd4) begin
//			PL7_drt  <= {DATA[68], DATA[69]} * s;
//		end
		
		
		if (DATA[64] == 7'd1) begin
			DL7_del  <= {DATA[65], DATA[66]} * ns;
		end
		
		if (DATA[64] == 7'd2) begin
			DL7_del  <= {DATA[65], DATA[66]} * us;
		end
		
		if (DATA[64] == 7'd3) begin
			DL7_del  <= {DATA[65], DATA[66]} * ms;
		end
		
//		if (DATA[64] == 7'd4) begin
//			DL7_del  <= {DATA[65], DATA[66]} * s;
//		end
				
		ch7_type_start <= DATA[63];
		
		
		
		
		
		
		
		
		
		
		if (DATA[60] == 7'd1) begin
			PL8_drt  <= {DATA[61], DATA[62]} * ns;
		end
		
		if (DATA[60] == 7'd2) begin
			PL8_drt  <= {DATA[61], DATA[62]} * us;
		end
		
		if (DATA[60] == 7'd3) begin
			PL8_drt  <= {DATA[61], DATA[62]} * ms;
		end
		
//		if (DATA[60] == 7'd4) begin
//			PL8_drt  <= {DATA[61], DATA[62]} * s;
//		end
		
		
		if (DATA[57] == 7'd1) begin
			DL8_del  <= {DATA[58], DATA[59]} * ns;
		end
		
		if (DATA[57] == 7'd2) begin
			DL8_del  <= {DATA[58], DATA[59]} * us;
		end
		
		if (DATA[57] == 7'd3) begin
			DL8_del  <= {DATA[58], DATA[59]} * ms;
		end
		
//		if (DATA[57] == 7'd4) begin
//			DL8_del  <= {DATA[58], DATA[59]} * s;
//		end
				
		ch8_type_start <= DATA[56];
		
		
		
		
		
	end	
	
	
	


	
end

	
endmodule
