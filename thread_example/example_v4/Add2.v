module Add(
    input [8:0] a,
    input [8:0] b,
    input [8:0] c,
    input [8:0] d,
    output [9:0] sum1,
    output [9:0] sum2
);

    assign sum1 = a + b;
    assign sum2 = c + d;

endmodule
