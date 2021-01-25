module Start (input st_clk, st_button, end_flg, pc_start, 
				  input [4:0] MPL1,
				  input [4:0] MPL2,
				  input [4:0] MPL3,
				  input [4:0] MPL4,
				  input [4:0] MPL5,
				  input [4:0] MPL6,	
				  input [4:0] MPL7,	
				  input [4:0] MPL8,
				  input [4:0] MPL9,
				  input [4:0] MPL10,	
				  input [4:0] MPL11,	
				  input [4:0] MPL12,
				  input [4:0] MPL13,
				  input [4:0] MPL14,
				  input [4:0] MPL15,
				  input [4:0] MPL16,				  
				  output reg st_o
				  
				  );


reg [40:0] cnt;									// counter for anti bounce and MAX duration light pulse
initial cnt <= 1'b0;

initial st_o <= 1'b0;

always @(posedge st_clk) begin
	
	//if () begin;
	
	//end
	
			if (st_button < 1'b1) begin
				st_o <= 1'b1;
			end
	
		
			if (end_flg == 1'b1) begin
				st_o <= 1'b0;
			end

end

endmodule					
