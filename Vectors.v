module top_module(
	input [2:0] vec, 
	output [2:0] outv,
	output o2,
	output o1,
	output o0
);
	
	assign outv = vec;

	// This is ok too: assign {o2, o1, o0} = vec;
	assign o0 = vec[0];
	assign o1 = vec[1];
	assign o2 = vec[2];
	
endmodule

module top_module (
	input [15:0] in,
	output [7:0] out_hi,
	output [7:0] out_lo
);
	
	assign out_hi = in[15:8];
	assign out_lo = in[7:0];
	
	// Concatenation operator also works: assign {out_hi, out_lo} = in;
	
endmodule

module top_module (
	input [31:0] in,
	output [31:0] out
);

	assign out[31:24] = in[ 7: 0];	
	assign out[23:16] = in[15: 8];	
	assign out[15: 8] = in[23:16];	
	assign out[ 7: 0] = in[31:24];	
	
endmodule

module top_module(
	input [2:0] a, 
	input [2:0] b, 
	output [2:0] out_or_bitwise,
	output out_or_logical,
	output [5:0] out_not
);
	
	assign out_or_bitwise = a | b;
	assign out_or_logical = a || b;

	assign out_not[2:0] = ~a;	// Part-select on left side is o.
	assign out_not[5:3] = ~b;	//Assigning to [5:3] does not conflict with [2:0]
	
endmodule

module top_module( 
    input [3:0] in,
    output out_and,
    output out_or,
    output out_xor
);

    assign out_and = &in;
    assign out_or  = |in;
    assign out_xor = ^in;

endmodule

module top_module (
    input [4:0] a, b, c, d, e, f,
    output [7:0] w, x, y, z );

    assign w = {a, b[4:2]};                    // 5 + 3 = 8 bits
    assign x = {b[1:0], c, d[4]};              // 2 + 5 + 1 = 8 bits
    assign y = {d[3:0], e[4:1]};               // 4 + 4 = 8 bits
    assign z = {e[0], f, 2'b11};              // 2 + 5 + 1 = 8 bits

endmodule

module top_module( 
    input [7:0] in,
    output [7:0] out
);
    assign out[7]=in[0];
    assign out[6]=in[1];
    assign out[5]=in[2];
    assign out[4]=in[3];
    assign out[3]=in[4];
    assign out[2]=in[5];
    assign out[1]=in[6];
    assign out[0]=in[7];
endmodule

module top_module (
    input [7:0] in,
    output [31:0] out );

    assign out = { {24{in[7]}}, in };

endmodule


module top_module (
    input a, b, c, d, e,
    output [24:0] out );

    wire [4:0] vec = {a, b, c, d, e};
    assign out[24:20]=~{5{a}}^{vec};
    assign out[19:15]=~{5{b}}^{vec};
    assign out[14:10]=~{5{c}}^{vec};
    assign out[9:5]=~{5{d}}^{vec};
    assign out[4:0]=~{5{e}}^{vec};
    

endmodule


