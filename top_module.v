module booth_multiplier(

input clk,
input start,

input [15:0] multiplicand,
input [15:0] multiplier,

output done,
output [31:0] product

);

wire ldA;
wire ldQ;
wire ldM;
wire clrA;
wire clrQ;
wire clrff;
wire sftA;
wire sftQ;
wire addsub;
wire decr;
wire ldcnt;

wire qm1;
wire q0;
wire eqz;

BOOTH DP(

.ldA(ldA),
.ldQ(ldQ),
.ldM(ldM),

.clrA(clrA),
.clrQ(clrQ),
.clrff(clrff),

.sftA(sftA),
.sftQ(sftQ),

.addsub(addsub),

.decr(decr),
.ldcnt(ldcnt),

.multiplicand(multiplicand),
.multiplier(multiplier),

.clk(clk),

.qm1(qm1),
.q0(q0),
.eqz(eqz),

.product(product)

);

controller CU(

.ldA(ldA),
.clrA(clrA),
.sftA(sftA),

.ldQ(ldQ),
.clrQ(clrQ),
.sftQ(sftQ),

.ldM(ldM),
.clrff(clrff),

.addsub(addsub),

.start(start),

.decr(decr),
.ldcnt(ldcnt),

.done(done),

.clk(clk),

.q0(q0),
.qm1(qm1),

.eqz(eqz)

);

always @(posedge clk)
begin
    $display("Time=%0t", $time);
    $display("State=%0d", CU.state);
    $display("A=%h Q=%h M=%h", DP.A, DP.Q, DP.M);
    $display("Z=%h Count=%d", DP.Z, DP.count);
    $display("q0=%b qm1=%b", DP.q0, DP.qm1);
    $display("ldA=%b ldQ=%b sftA=%b sftQ=%b addsub=%b",
             ldA, ldQ, sftA, sftQ, addsub);
    $display("---------------------------");
end

endmodule