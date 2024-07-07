module transmitter_tb;
    reg clk, reset, tx_start;
    reg rd, wr_uart;
    reg [7 : 0] w_data;
    wire [7 : 0]din;
    wire tx_done_tick;
    wire tx, s_tick;
    wire rx_done_tick;
    wire [7 : 0] dout;
    

    mod_m_counter MC(.clk(clk), .reset(reset), .max_tick(s_tick), .q());
    uart_tx TX(.clk(clk), .reset(reset), .tx_start(tx_start), .s_tick(s_tick), .din(din), .tx_done_tick(tx_done_tick), .tx(tx));
    uart_rx RX(.clk(clk), .reset(reset), .rx(tx), .s_tick(s_tick), .rx_done_tick(rx_done_tick), .dout(dout)); 
    fifo F1(.clk(clk), .reset(reset), .rd(rd), .wr(wr_uart), .w_data(w_data), .empty(), .full(), .r_data(din));
    initial 
	begin 
	    clk = 1'b0;
    	    reset = 1'b1;
	    w_data = 8'b10110010;
	    wr_uart = 1'b1;
	    #12 reset = 1'b0;
	    #22 rd = 1'b1;
		tx_start = 1'b1;
	end

    always
	
	    #5 clk = ~clk;
	    
	
endmodule
	
	