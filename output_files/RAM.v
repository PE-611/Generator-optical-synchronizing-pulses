module RAM(output reg [7:0] out,
			  input clk_RAM,
			  input [7:0] in,
			  input [3:0] addr,
			  input RW);

reg [7:0] DATA[7:0];

initial begin
DATA[0] = 1'd1;
DATA[1] = 1'd2;
DATA[2] = 1'd3;
DATA[3] = 1'd4;
DATA[4] = 1'd5;
DATA[5] = 1'd6;
DATA[6] = 1'd7;
DATA[7] = 1'd8;
end


always @(posedge clk_RAM) begin
	
	if(RW == 1'b0) //READ
		out <= DATA[addr];
		
	else if(RW == 1'b1) //WRITE
		DATA[addr] <= in;
		
	else
		out <= 8'd0;
		
end
endmodule