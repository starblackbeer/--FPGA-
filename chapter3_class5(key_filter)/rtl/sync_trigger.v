module sync_trigger(clk, rst_n, key_in, key_out);
	input  clk, rst_n, key_in;
	output reg key_out;
	
	reg key_a;
	//此模块主要借助两个D触发器进行信号与模块时钟的同步，
	always@(posedge clk or negedge rst_n)
	begin
		if(!rst_n)
		begin
			key_a <= 1'b0;
			key_out <= 1'b0;
		end
		else	
		begin
			key_out <= key_a;
			key_a <= key_in;
		end
	end
endmodule