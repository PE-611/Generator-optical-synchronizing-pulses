
module DLST (input clk_dlst, din,
				  output reg dout 
				 );
				
reg [34:0] cnt1;
initial cnt1 <= 35'd0;
initial dout <= 1'b0;
reg fld;
initial fld <= 1'b0;


always @(posedge clk_dlst) begin
	
		
		if (din == 1'b1) begin
			fld <= 1'b1;
		end
		if (fld == 1'b1) begin
			cnt1 <= cnt1 + 1'b1;
		end
		
		if (cnt1 >= 24'd200000000) begin
			cnt1 <= 1'b0;
			fld <= 1'b0;
			dout <= 1'b1;
		end	
		
		if (dout == 1'b1) begin
			dout <= 1'b0;
		end
		
		
	
end




endmodule

