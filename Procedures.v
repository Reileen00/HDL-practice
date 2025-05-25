// synthesis verilog_input_version verilog_2001
module top_module(
    input a, 
    input b,
    output wire out_assign,
    output reg out_alwaysblock
);

// Continuous assignment (assign must be outside always block)
assign out_assign = a & b;

// Combinational always block (no 'assign' inside)
always @(*) begin
    out_alwaysblock = a & b;
end

endmodule

// synthesis verilog_input_version verilog_2001
module top_module(
    input a,
    input b,
    input sel_b1,
    input sel_b2,
    output wire out_assign,
    output reg out_always
); 
    // Corrected conditional expressions using '=='
    assign out_assign = (sel_b1 == 0) ? a : (sel_b2 == 0) ? a : b;

    // Procedural assignment inside always block
    always @(*) begin
        out_always = (sel_b1 == 0) ? a : (sel_b2 == 0) ? a : b;
    end
endmodule


// synthesis verilog_input_version verilog_2001
module top_module (
    input      cpu_overheated,
    output reg shut_off_computer,
    input      arrived,
    input      gas_tank_empty,
    output reg keep_driving  ); //

    always @(*) begin
        if (cpu_overheated)
           shut_off_computer = 1;
        else 
            shut_off_computer=0;
    
    end

    always @(*) begin
        if (~arrived)
           keep_driving = ~gas_tank_empty;
        else 
            keep_driving=0;
    end

endmodule

// synthesis verilog_input_version verilog_2001
module top_module ( 
    input [2:0] sel, 
    input [3:0] data0,
    input [3:0] data1,
    input [3:0] data2,
    input [3:0] data3,
    input [3:0] data4,
    input [3:0] data5,
    output reg [3:0] out   );//

    always@(*) begin  // This is a combinational circuit
        case(sel)
            3'b000:out=data0;
            3'b001:out=data1;
            3'b010:out=data2;
            3'b011:out=data3;
            3'b100:out=data4;
            3'b101:out=data5;
            default:out=4'b000;
        endcase
    end

endmodule

// synthesis verilog_input_version verilog_2001
module top_module (
    input [3:0] in,
    output reg [1:0] pos  
);

    always @(*) begin
        casez (in)
            4'b???1: pos = 2'd0;
            4'b??10: pos = 2'd1;
            4'b?100: pos = 2'd2;
            4'b1000: pos = 2'd3;
            default: pos = 2'd0; // Shouldn't happen, but safe default
        endcase
    end

endmodule


