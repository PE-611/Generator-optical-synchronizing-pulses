///////////////////////////////////////////////////////////
// Name File : RAM.v 												//
// Autor : Dyomkin Pavel Mikhailovich 							//
// Company : GSC RF TRINITI										//
// Description : UART Rx module								  	//
// Start design : 22.10.2020 										//
// Last revision : 27.10.2020 									//
///////////////////////////////////////////////////////////

module RAM(//output reg [31:0] out, 

			  output reg [16:0] PL1_drt,
			  output reg [16:0] DL1_del,
			  output reg [3:0] ch1_type_start,
			  output reg [4:0] Mult_PL1,
			  output reg [4:0] Mult_DL1,
			  
			  output reg [16:0] PL2_drt,
			  output reg [16:0] DL2_del,
			  output reg [3:0]ch2_type_start,
			  output reg [4:0] Mult_PL2,
			  output reg [4:0] Mult_DL2,
			  
			  output reg [16:0] PL3_drt,
			  output reg [16:0] DL3_del,
			  output reg [3:0]ch3_type_start,
			  output reg [4:0] Mult_PL3,
			  output reg [4:0] Mult_DL3,
			  
			  output reg [16:0] PL4_drt,
			  output reg [16:0] DL4_del,
			  output reg [3:0]ch4_type_start,
			  output reg [4:0] Mult_PL4,
			  output reg [4:0] Mult_DL4,
			  
			  output reg [16:0] PL5_drt,
			  output reg [16:0] DL5_del,
			  output reg [3:0]ch5_type_start,
			  output reg [4:0] Mult_PL5,
			  output reg [4:0] Mult_DL5,
			  
			  output reg [16:0] PL6_drt,
			  output reg [16:0] DL6_del,
			  output reg [3:0]ch6_type_start,
			  output reg [4:0] Mult_PL6,
			  output reg [4:0] Mult_DL6,
			  
			  output reg [16:0] PL7_drt,
			  output reg [16:0] DL7_del,
			  output reg [3:0]ch7_type_start,
			  output reg [4:0] Mult_PL7,
			  output reg [4:0] Mult_DL7,
			  
			  output reg [16:0] PL8_drt,
			  output reg [16:0] DL8_del,
			  output reg [3:0]ch8_type_start,
			  output reg [4:0] Mult_PL8,
			  output reg [4:0] Mult_DL8,
			  
			  output reg [16:0] PL9_drt,
			  output reg [16:0] DL9_del,
			  output reg [3:0]ch9_type_start,
			  output reg [4:0] Mult_PL9,
			  output reg [4:0] Mult_DL9,
			  
			  output reg [16:0] PL10_drt,
			  output reg [16:0] DL10_del,
			  output reg [3:0]ch10_type_start,
			  output reg [4:0] Mult_PL10,
			  output reg [4:0] Mult_DL10,
			  
			  output reg [16:0] PL11_drt,
			  output reg [16:0] DL11_del,
			  output reg [3:0]ch11_type_start,
			  output reg [4:0] Mult_PL11,
			  output reg [4:0] Mult_DL11,
			  
			  output reg [16:0] PL12_drt,
			  output reg [16:0] DL12_del,
			  output reg [3:0]ch12_type_start,
			  output reg [4:0] Mult_PL12,
			  output reg [4:0] Mult_DL12,
			  
			  output reg [16:0] PL13_drt,
			  output reg [16:0] DL13_del,
			  output reg [3:0]ch13_type_start,
			  output reg [4:0] Mult_PL13,
			  output reg [4:0] Mult_DL13,
			  
			  output reg [16:0] PL14_drt,
			  output reg [16:0] DL14_del,
			  output reg [3:0]ch14_type_start,
			  output reg [4:0] Mult_PL14,
			  output reg [4:0] Mult_DL14,
			  
			  output reg [16:0] PL15_drt,
			  output reg [16:0] DL15_del,
			  output reg [3:0]ch15_type_start,
			  output reg [4:0] Mult_PL15,
			  output reg [4:0] Mult_DL15,
			  
			  output reg [16:0] PL16_drt,
			  output reg [16:0] DL16_del,
			  output reg [3:0]ch16_type_start,
			  output reg [4:0] Mult_PL16,
			  output reg [4:0] Mult_DL16,
			  
			  output reg pc_start,
			  
								
			  input clk_RAM,
			  input [7:0] in,
			  input [7:0] w_addr,
			  input write
			  
			  );

reg read;
initial read <= 1'b1;			  
reg [7:0] DATA [112:0]; 

initial pc_start <= 1'b0;



always @(posedge clk_RAM) begin
	
	if(write == 1'b0) begin											//write if == 1'b0 else prohibition on write
		DATA[w_addr]=in;
		
	end
	
	if (read == 1'b1) begin                               // Readiness flag always = 1, READ if == 1'b1 else prohibition on read
			
		
		
			PL1_drt  <= {DATA[110], DATA[111]};
			Mult_PL1 <= DATA[109];
			DL1_del  <= {DATA[107], DATA[108]};
			Mult_DL1 <= DATA[106];
		   ch1_type_start <= DATA[105];
			

			PL2_drt  <= {DATA[103], DATA[104]};
			Mult_PL2 <= DATA[102];
			DL2_del  <= {DATA[100], DATA[101]};
			Mult_DL2 <= DATA[99];
		   ch2_type_start <= DATA[98];
			
			
		   PL3_drt  <= {DATA[96], DATA[97]};
			Mult_PL3 <= DATA[95];
			DL3_del  <= {DATA[93], DATA[94]};
			Mult_DL3 <= DATA[92];
		   ch3_type_start <= DATA[91];
			
			PL4_drt  <= {DATA[89], DATA[90]};
			Mult_PL4 <= DATA[88];
			DL4_del  <= {DATA[86], DATA[87]};
			Mult_DL4 <= DATA[85];
		   ch4_type_start <= DATA[84];
			
			PL5_drt  <= {DATA[82], DATA[83]};
			Mult_PL5 <= DATA[81];
			DL5_del  <= {DATA[79], DATA[80]};
			Mult_DL5 <= DATA[78];
		   ch5_type_start <= DATA[77];
			
			PL6_drt  <= {DATA[75], DATA[76]};
			Mult_PL6 <= DATA[74];
			DL6_del  <= {DATA[72], DATA[73]};
			Mult_DL6 <= DATA[71];
		   ch6_type_start <= DATA[70];
			
			PL7_drt  <= {DATA[68], DATA[69]};
			Mult_PL7 <= DATA[67];
			DL7_del  <= {DATA[65], DATA[66]};
			Mult_DL7 <= DATA[64];
		   ch7_type_start <= DATA[63];
			
			PL8_drt  <= {DATA[61], DATA[62]};
			Mult_PL8 <= DATA[60];
			DL8_del  <= {DATA[58], DATA[59]};
			Mult_DL8 <= DATA[57];
		   ch8_type_start <= DATA[56];
			
			
			
			
			
			if (DATA[0] > 1'b0) begin
				pc_start <= 1'b1;
			end
			
			if (pc_start == 1'b1) begin
				DATA[0] <= 1'b0;
				pc_start <= 1'b0;
			end
	
		
		
		
		
		
		
		
	end	
	
	
	


	
end

	
endmodule
