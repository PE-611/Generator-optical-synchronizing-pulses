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
			
		
		
			PL1_drt  <= {DATA[111], DATA[112]};
			Mult_PL1 <= DATA[110];
			DL1_del  <= {DATA[108], DATA[109]};
			Mult_DL1 <= DATA[107];
		   ch1_type_start <= DATA[106];
			

			PL2_drt  <= {DATA[104], DATA[105]};
			Mult_PL2 <= DATA[103];
			DL2_del  <= {DATA[101], DATA[102]};
			Mult_DL2 <= DATA[100];
		   ch2_type_start <= DATA[99];
			
			
		   PL3_drt  <= {DATA[97], DATA[98]};
			Mult_PL3 <= DATA[96];
			DL3_del  <= {DATA[94], DATA[95]};
			Mult_DL3 <= DATA[93];
		   ch3_type_start <= DATA[92];
			
			PL4_drt  <= {DATA[90], DATA[91]};
			Mult_PL4 <= DATA[89];
			DL4_del  <= {DATA[87], DATA[88]};
			Mult_DL4 <= DATA[86];
		   ch4_type_start <= DATA[85];
			
			PL5_drt  <= {DATA[83], DATA[84]};
			Mult_PL5 <= DATA[82];
			DL5_del  <= {DATA[80], DATA[81]};
			Mult_DL5 <= DATA[79];
		   ch5_type_start <= DATA[78];
			
			PL6_drt  <= {DATA[76], DATA[77]};
			Mult_PL6 <= DATA[75];
			DL6_del  <= {DATA[73], DATA[74]};
			Mult_DL6 <= DATA[72];
		   ch6_type_start <= DATA[71];
			
			PL7_drt  <= {DATA[69], DATA[70]};
			Mult_PL7 <= DATA[68];
			DL7_del  <= {DATA[66], DATA[67]};
			Mult_DL7 <= DATA[65];
		   ch7_type_start <= DATA[64];
			
			PL8_drt  <= {DATA[62], DATA[63]};
			Mult_PL8 <= DATA[61];
			DL8_del  <= {DATA[59], DATA[60]};
			Mult_DL8 <= DATA[58];
		   ch8_type_start <= DATA[57];
			
			PL9_drt  <= {DATA[55], DATA[56]};
			Mult_PL9 <= DATA[54];
			DL9_del  <= {DATA[52], DATA[53]};
			Mult_DL9 <= DATA[51];
		   ch9_type_start <= DATA[50];
			
			PL10_drt  <= {DATA[48], DATA[49]};
			Mult_PL10 <= DATA[47];
			DL10_del  <= {DATA[45], DATA[46]};
			Mult_DL10 <= DATA[44];
		   ch10_type_start <= DATA[43];
			
			PL11_drt  <= {DATA[41], DATA[42]};
			Mult_PL11 <= DATA[40];
			DL11_del  <= {DATA[38], DATA[39]};
			Mult_DL11 <= DATA[37];
		   ch11_type_start <= DATA[36];
			
			PL12_drt  <= {DATA[34], DATA[35]};
			Mult_PL12 <= DATA[33];
			DL12_del  <= {DATA[31], DATA[32]};
			Mult_DL12 <= DATA[30];
		   ch12_type_start <= DATA[29];
			
			PL13_drt  <= {DATA[27], DATA[28]};
			Mult_PL13 <= DATA[26];
			DL13_del  <= {DATA[24], DATA[25]};
			Mult_DL13 <= DATA[23];
		   ch13_type_start <= DATA[22];
			
			PL14_drt  <= {DATA[20], DATA[21]};
			Mult_PL14 <= DATA[19];
			DL14_del  <= {DATA[17], DATA[18]};
			Mult_DL14 <= DATA[16];
		   ch14_type_start <= DATA[15];
			
			PL15_drt  <= {DATA[13], DATA[14]};
			Mult_PL15 <= DATA[12];
			DL15_del  <= {DATA[10], DATA[11]};
			Mult_DL15 <= DATA[9];
		   ch15_type_start <= DATA[8];
			
			PL16_drt  <= {DATA[6], DATA[7]};
			Mult_PL15 <= DATA[5];
			DL16_del  <= {DATA[3], DATA[4]};
			Mult_DL16 <= DATA[2];
		   ch16_type_start <= DATA[1];
			
			

			
			
			
			
			if (DATA[0] == 8'd255) begin
				DATA[0] <= 1'b0;
				pc_start <= 1'b1;
			end
			
			if (pc_start == 1'b1) begin
				pc_start <= 1'b0;
				DATA[0] <= 1'b0;
			end
			
		
		
		
		
		
		
		
	end	
	
	
	


	
end

	
endmodule
