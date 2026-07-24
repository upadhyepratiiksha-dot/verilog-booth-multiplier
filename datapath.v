module BOOTH (
    ldA, ldQ, ldM,
    clrA, clrQ, clrff,
    sftA, sftQ,
    addsub,
    decr, ldcnt,
    multiplicand,
    multiplier,
    clk,
    qm1,
    q0,
    eqz,
    product
);

input ldA, ldQ, ldM;
input clrA, clrQ, clrff;
input sftA, sftQ;
input addsub;
input decr, ldcnt;
input clk;

input [15:0] multiplicand;
input [15:0] multiplier;

output qm1;
output q0;
output eqz;
output [31:0] product;

wire [15:0] A;
wire [15:0] M;
wire [15:0] Q;
wire [15:0] Z;
wire [4:0] count;

assign q0 = Q[0];

assign eqz = ~|count;

assign product = {A,Q};

shiftreg AR(
    .data_out(A),
    .data_in(Z),
    .s_in(A[15]),
    .clk(clk),
    .ld(ldA),
    .clr(clrA),
    .sft(sftA)
);

shiftreg QR(
    .data_out(Q),
    .data_in(multiplier),
    .s_in(A[0]),
    .clk(clk),
    .ld(ldQ),
    .clr(clrQ),
    .sft(sftQ)
);

dff QM1 (
    .d(Q[0]),
    .q(qm1),
    .clk(clk),
    .clr(clrff)
);

PIPO MR (
    .data_in(multiplicand),
    .data_out(M),
    .clk(clk),
    .load(ldM)
);

ALU AS(
    .out(Z),
    .in1(A),
    .in2(M),
    .addsub(addsub)
);

counter CN (
    .data_out(count),
    .decr(decr),
    .ldcnt(ldcnt),
    .clk(clk)
);

endmodule