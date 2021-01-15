module Start (input st_clk, st_button,
				  output reg st_o						// STUFF 
				  );


reg [31:0] cnt;									// counter for anti bounce and MAX duration light pulse

reg start_flag;									// flag for anti bounce and MAX duration light pulse
initial start_flag <= 1'b0;

always @(posedge st_clk) begin


	if (st_button < 1'b1) begin
		start_flag <= 1'b1;
	end
	
	if (start_flag == 1'b1) begin
		cnt <= cnt + 1'b1;						// << anti bounce and MAX duration light pulse 
		st_o <= 1'b1;
	end
	
	if (cnt == 32'd100000000) begin        //Введи блок расчета суммы длительност при работы всех импульсов и блокируй работу системы до окончания всей генерации
 		cnt <= 32'd0;
		start_flag <= 1'b0;
		st_o <= 1'b0;
	end
end

endmodule					
