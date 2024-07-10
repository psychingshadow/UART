module uart
    #( //Default setting : 
       // 19,200 baud, 8 data bits, 1 stop bit, 2^4 FIFO
	parameter D_BIT = 8,	// number of data bits
		  SB_TICK = 16, // number of ticks for stop bits
				// 16/24/32 for 1/1.5/2 bits
		  DVSR = 163,   // baud rate divisor
		  		// dvsr = 50M/(16*baud rate)
		  DVSR_BIT = 8, // number of bits of DVSR
		  FIFO_W = 4    // number of address bits of FIFO
				// number of words = 2^FIFO_W
     )
    (
	input wire clk, reset,
	input wire tx_start,
	input [7 : 0] din,
	output tx_done_tick, rx_done_tick, s_tick, 
	output [7 : 0] dout
    );

    // signal declaration
    wire tx;

    // body
    mod_m_counter BRG(.clk(clk),.reset(reset), .max_tick(s_tick), .q());
    uart_tx TX(.clk(clk), .reset(reset), .tx_start(tx_start), .s_tick(s_tick), .din(din), .tx_done_tick(tx_done_tick), .tx(tx));
    uart_rx RX(.clk(clk), .reset(reset), .rx(tx), .s_tick(s_tick), .rx_done_tick(rx_done_tick), .dout(dout));

endmodule