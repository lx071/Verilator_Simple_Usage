module dut(
    input logic sys_clk,
    input logic othr_clk
);

int sys_cnt = 0;
int othr_cnt = 0;

always @(posedge sys_clk) begin
    sys_cnt++;
end

always @(posedge othr_clk) begin
    othr_cnt++;
end

always @(othr_cnt) begin
    if (othr_cnt > 10) $finish();
end

endmodule