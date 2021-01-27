module Start (input st_clk, st_button, end_flg, PC_start, 
			  	  output reg st_o
				  
				  );


reg [40:0] cnt;									// counter for anti bounce and MAX duration light pulse
initial cnt <= 1'b0;

initial st_o <= 1'b0;

always @(posedge st_clk) begin
	
			
			if (PC_start == 1'b1) begin
				st_o <= 1'b1;
			end
 
			if (st_button < 1'b1) begin
				st_o <= 1'b1;
			end
	
		
			if (end_flg == 1'b1) begin
				st_o <= 1'b0;
			end

end

endmodule					
