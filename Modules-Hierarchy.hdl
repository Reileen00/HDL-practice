module top_module ( input a, input b, output out );
    mod_a instance1 (a,b,out);
endmodule

module top_module ( 
    input a, 
    input b, 
    input c,
    input d,
    output out1,
    output out2
);
    mod_a instance1 (out1,out2,a,b,c,d);
endmodule

module top_module ( 
    input a, 
    input b, 
    input c,
    input d,
    output out1,
    output out2
);
    mod_a instance1 (.out1(out1),.out2(out2),.in1(a),.in2(b),.in3(c),.in4(d));
endmodule


module top_module (
    input clk,
    input d,
    output q
);
    wire q1, q2;

    my_dff instance1 (.clk(clk), .d(d), .q(q1));
    my_dff instance2 (.clk(clk), .d(q1), .q(q2));
    my_dff instance3 (.clk(clk), .d(q2), .q(q));
endmodule

module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q
);
    wire [7:0] q1,q2,q3;
    my_dff8 instance1(.clk(clk),.d(d),.q(q1));
    my_dff8 instance2(.clk(clk),.d(q1),.q(q2));
    my_dff8 instance3(.clk(clk),.d(q2),.q(q3));
    always @(*) begin
        case (sel)
            2'b00: q = d;
            2'b01: q = q1;
            2'b10: q = q2;
            2'b11: q = q3;
            default: q = 8'b0;
        endcase
    end
endmodule

module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);  
    wire [15:0] cout1,cout2;
    add16 instance1(.a(a[15:0]),.b(b[15:0]),.cin(1'b0),.sum(sum[15:0]),.cout(cout1));
    add16 instance2(.a(a[31:16]),.b(b[31:16]),.cin(cout1),.sum(sum[31:16]),.cout(cout2));
endmodule

module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//
    wire cout1,cout2;
    add16 instance1(.a(a[15:0]),.b(b[15:0]),.cin(0),.sum(sum[15:0]),.cout(cout1));
    add16 instance2(.a(a[31:16]),.b(b[31:16]),.cin(cout1),.sum(sum[31:16]),.cout(cout2));
endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );

// Full adder module here
    assign sum=a^b^cin;
    assign cout=a&b | a&cin | b&cin;

endmodule

module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
wire cout1,cout2,cout3;
    wire [15:0] sum2;
    wire [15:0]sum3;
    add16 instance1(.a(a[15:0]),.b(b[15:0]),.cin(1'b0),.sum(sum[15:0]),.cout(cout1));
    add16 instance2(.a(a[31:16]),.b(b[31:16]),.cin(1'b0),.sum(sum2),.cout(cout2));
    add16 instance3(.a(a[31:16]),.b(b[31:16]),.cin(1'b1),.sum(sum3),.cout(cout3));
    always @(*) begin
        case (cout1)
            1'b1 : sum[31:16]=sum3;
            1'b0 : sum[31:16]=sum2;
            default : sum[31:16]=16'b1111111111111111;
        endcase
    end
endmodule

module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire[31:0] bb;
    wire cout,cout1;
    assign bb=b^{32{sub}};
    add16 instance1(.a(a[15:0]),.b(bb[15:0]),.cin(sub),.sum(sum[15:0]),.cout(cout1));
    add16 instance2(.a(a[31:16]),.b(bb[31:16]),.cin(cout1),.sum(sum[31:16]),.cout(cout));
endmodule


