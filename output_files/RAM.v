///////////////////////////////////////////////////////////
// Name File : RAM.v 												//
// Autor : Dyomkin Pavel Mikhailovich 							//
// Company : GSC RF TRINITI										//
// Description : UART Rx module								  	//
// Start design : 22.10.2020 										//
// Last revision : 27.10.2020 									//
///////////////////////////////////////////////////////////

module RAM(output reg [31:0] out, 

			  output reg [35:0] PL1_drt,
			  output reg [35:0] DL1_del,
			  output reg ch1_type_start,
			  
			  output reg [35:0] PL2_drt,
			  output reg [35:0] DL2_del,
			  output reg ch2_type_start,
			  
			  
								
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
		
		
		

	end	
	
	
	


	
end

	
endmodule
