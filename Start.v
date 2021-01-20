module Start (input st_clk, st_button,
				  output reg st_o						// STUFF 
				  );


reg [31:0] cnt;									// counter for anti bounce and MAX duration light pulse



always @(posedge st_clk) begin


	if (st_button < 1'b1) begin
		st_o <= 1'b1;
	end
	
	
	
	if (st_o == 1'b1) begin
		cnt <= cnt + 1'b1;						// << anti bounce and MAX duration light pulse 
	end
	
	if (cnt == 32'd500000000) begin        //Введи блок расчета суммы длительност при работы всех импульсов и блокируй работу системы до окончания всей генерации
 		cnt <= 32'd0;
		st_o <= 1'b0;
	end
	
	
end

endmodule					
