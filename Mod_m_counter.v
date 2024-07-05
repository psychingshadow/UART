module mod_m_counter
    #(
        parameter N = 8,    // number of bits in counter
		  M = 163  // mod - M
     )
    (
	input wire clk, reset,
	output wire [N - 1 : 0] q
    );

    // signal declaration
    reg [N - 1 : 0] r_reg;
    wire [N - 1 : 0] r_next;

    // body
    // register
    always @(posedge clk, posedge reset)
	if(reset)
	    r_reg <= 0;
	else
	    r_reg <= r_next;

    // next-state logic
    assign r_next = (r_reg == (M - 1)) ? 0 : r_reg + 1;
    // output logic
    assign q = r_reg;

endmodule
	    
