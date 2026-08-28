module tb;

reg clk, reset;
reg [1:0] mode;
reg [3:0] parallel_in;
reg serial_left, serial_right;
wire [3:0] Q;

universal_shift_register uut(
    clk,
    reset,
    mode,
    parallel_in,
    serial_left,
    serial_right,
    Q
);

always #5 clk = ~clk;

initial begin

    $dumpfile("dump.vcd");
    $dumpvars(0, tb);

    clk = 0;
    reset = 1;
    mode = 2'b00;
    parallel_in = 4'b0000;
    serial_left = 0;
    serial_right = 0;

    #10;
    reset = 0;

    // Parallel Load
    parallel_in = 4'b1010;
    mode = 2'b11;
    #10;

    // Shift Right
    serial_right = 1;
    mode = 2'b01;
    #10;

    // Shift Left
    serial_left = 1;
    mode = 2'b10;
    #10;

    // Hold
    mode = 2'b00;
    #10;

    // Parallel Load another value
    parallel_in = 4'b1100;
    mode = 2'b11;
    #10;

    $finish;
end

endmodule