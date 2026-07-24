`timescale 1ns/1ps

module booth_multiplier_tb;

reg clk;
reg start;

reg [15:0] multiplicand;
reg [15:0] multiplier;

wire done;
wire [31:0] product;

booth_multiplier DUT(

.clk(clk),
.start(start),

.multiplicand(multiplicand),
.multiplier(multiplier),

.done(done),
.product(product)

);

initial
begin
    clk=0;
    forever #5 clk=~clk;
end

initial
begin

start=0;

multiplicand=16'd5;
multiplier=16'd3;

#20;

start=1;

#10;

start=0;

wait(done);

$display("Product = %d",product);

#20;

$finish;

end

endmodule