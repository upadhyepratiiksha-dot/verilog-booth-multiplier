module PIPO (data_out, data_in, clk, load);

input [15:0] data_in;

input load, clk;

output reg [15:0] data_out;

always @(posedge clk)

if (load) data_out <= data_in;

endmodule

module dff (d, q, clk, clr);

input d, clk, clr;

output reg q;

always @(posedge clk)

if (clr)
    q <= 0;

else
    q <= d;

endmodule