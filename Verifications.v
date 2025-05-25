module top_module ();

    reg clk;

    // Instantiate the DUT
    dut u1 (.clk(clk));

    // Clock generation: Period = 10 ps, toggle every 5 ps
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

endmodule


module top_module ( output reg A, output reg B );//

    // generate input patterns here
    initial begin
		A=0;
        #10 A=1;
        #10 A=0;
    end
    initial begin
        B=0;
        #15 B=1;
        #25 B=0;
    end

endmodule


module top_module();
    reg [1:0] in;
    wire out;

    // Apply all 4 combinations to the 2-bit input
    initial begin
        in = 2'b00;  // 0
        #10 in = 2'b01; // 1
        #10 in = 2'b10; // 2
        #10 in = 2'b11; // 3
    end

    // Instantiate the andgate
    andgate uut (
        .in(in),
        .out(out)
    );
endmodule

module top_module();
    reg clk;
    reg in;
    reg [2:0] s;
    reg out;
	initial begin
        clk=0;
        forever #5 clk=~clk;
    end
    initial begin
        in=0;
        #20 in=1;
        #10 in=0;
        #10 in=1;
        #30 in=0;
    end
    initial begin
        s=3'd2;
        #10 s=3'd6;
        #10 s=3'd2;
        #10 s=3'd7;
        #10 s=3'd0;
    end
    q7 uut(.clk(clk),.in(in),.s(s),.out(out));
endmodule


module top_module ();
    reg clk;
    reg reset;
    reg t;
    wire q;

    // Instantiate the T flip-flop
    tff uut (
        .clk(clk),
        .reset(reset),
        .t(t),
        .q(q)
    );

    // Clock generation: 10 time unit period
    initial clk = 0;
    always #5 clk = ~clk; // Toggle every 5 units → period = 10

    // Stimulus
    initial begin
        reset = 1; t = 0; // Start with reset
        #10;              // Hold reset for 1 clock cycle
        reset = 0; t = 1; // Deassert reset, enable toggle
        #100;             // Run for enough time to see multiple toggles
        $finish;
    end
endmodule
