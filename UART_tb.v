module uart_tb;
    reg clk, reset;
    reg tx_start;
    reg [7 : 0] din;
    wire tx_done_tick, rx_done_tick;
    wire [7 : 0] dout;
    wire s_tick;

uart dut(.clk(clk), .reset(reset), .tx_start(tx_start), .din(din), .tx_done_tick(tx_done_tick), .rx_done_tick(rx_done_tick), .dout(dout), .s_tick(s_tick));

initial 
    begin
	clk = 1'b0;
	reset = 1'b1;
    end

always
    #5 clk = ~clk;

initial 
    begin
	#7 reset = 1'b0;
	din = 8'b10110010;
	tx_start = 1'b1;
    end



endmodule
	
