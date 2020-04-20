`timescale 10ns/1ns

module binary_to_bcd_test;
	reg clk = 0;
	reg [7:0] eight_bit_value = 0;
	wire [3:0] ones;
	wire [3:0] tens;
	wire [3:0] hundreds;
	
binary_to_bcd DUT(.clk(clk), .eight_bit_value(eight_bit_value), .ones(ones), .tens(tens), .hundreds(hundreds));

always
	#5 clk = ~clk;
	
initial
	begin
		$dumpfile("binary_to_bcd_test.vcd");
		$dumpvars(0, binary_to_bcd_test);
		$monitor($time, "clk = %b, eight_bit_value = %d, hundreds = %b, tens = %b, ones = %b", clk, eight_bit_value, hundreds, tens, ones);
		eight_bit_value = 0;
		#500 eight_bit_value = 10;
		#500 eight_bit_value = 59;
		#500 eight_bit_value = 137;
		#1000 $finish;
	end
endmodule