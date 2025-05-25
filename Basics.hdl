module top_module( input in, output out );
	
	assign out = in;
	// Note that wires are directional, so "assign in = out" is not equivalent.
	
endmodule

module top_module (
	input a,
	input b,
	input c,
	output w,
	output x,
	output y,
	output z  );
	
	assign w = a;
	assign x = b;
	assign y = b;
	assign z = c;

	// If we're certain about the width of each signal, using 
	// the concatenation operator is equivalent and shorter:
	// assign {w,x,y,z} = {a,b,b,c};
	
endmodule


module top_module(
	input in,
	output out
);
	
	assign out = ~in;
	
endmodule

module top_module( 
    input a, 
    input b, 
    output out );

    assign out = a & b;

endmodule


module top_module( 
    input a, 
    input b, 
    output out );

    assign out = ~(a | b);

endmodule


module top_module( 
    input a, 
    input b, 
    output out );

    assign out = ~(a ^ b);

endmodule


`default_nettype none
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n
);

    wire and1, or1;

    assign and1 = a & b;     // First intermediate wire: AND of a and b
    assign or1 = c | d;      // Second intermediate wire: OR of c and d
    assign out = and1 ^ or1; // XOR of intermediate results
    assign out_n = ~out;     // NOT of final output

endmodule


module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );

    wire and1, and2, and3, and4;

    assign and1 = p1a & p1b & p1c;
    assign and2 = p1d & p1e & p1f;
    assign and3 = p2a & p2b & p2c;
    assign and4 = p2a & p2b & p2d;

    assign p1y = and1 | and2;
    assign p2y = and3 | and4;

endmodule
