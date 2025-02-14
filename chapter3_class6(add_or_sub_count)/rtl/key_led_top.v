module key_led_top(
	input clk,
	input rst_n,
	input key_in0,
	input key_in1,
	output [3:0] led
);
	wire key_flag0, key_flag1;
	wire key_state0, key_state1;
	//对按键进行消抖操作，默认时间为20ms
	key_filter key_filter0(
		.clk(clk),
		.rst_n(rst_n),
		.key_in(key_in0),
		.key_flag(key_flag0),
		.key_state(key_state0)
	);
	key_filter key_filter1(
		.clk(clk),
		.rst_n(rst_n),
		.key_in(key_in1),
		.key_flag(key_flag1),
		.key_state(key_state1)
	);
	//key_state0为增加，key_state1为减少，只有有效按下的瞬间才会触发计数，一直按下按键不能一直触发加减
	led_ctrl led_ctrl0(
		.clk(clk),
		.rst_n(rst_n),
		.key_state0(key_state0),
		.key_flag0(key_flag0),
		.key_state1(key_state1),
		.key_flag1(key_flag1),
		.led(led)
	);
	
endmodule