module uart_tb;
    reg clk, reset;
    reg wr_uart, rd_uart;
    reg [7 : 0] w_data;
    wire [7 : 0] r_data;
    wire tx_full, rx_empty;

    

    uart U(.clk(clk), .reset(reset), .rd_uart(rd_uart), .wr_uart(wr_uart), .w_data(w_data),  .tx_full(tx_full), .rx_empty(rx_empty), .r_data(r_data));

    initial 
	begin 
	    clk = 1'b0;
    	    reset = 1'b1;
	    w_data = 8'b11110100;
	    wr_uart = 1'b1;
	    rd_uart = 1'b0;
	    #12 reset = 1'b0;
	end

    always
	#5 clk = ~clk;
	
	    
	
endmodule
	
	