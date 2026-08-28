module tb;

reg clk;
reg reset;
reg [3:0] N;
wire [3:0] count;

modulo_counter #(4) uut(
    clk,
    reset,
    N,
    count
);

always #5 clk = ~clk;

initial begin

    $dumpfile("dump.vcd");
    $dumpvars(0, tb);

    clk = 0;
    reset = 1;
    N = 4'd10;

    #10;
    reset = 0;

    #100;

    // Change modulo value to 5
    N = 4'd5;

    #60;

    $finish;
end

endmodule