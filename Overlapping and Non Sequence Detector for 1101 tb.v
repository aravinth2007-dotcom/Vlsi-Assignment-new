module tb;

reg clk, reset, data, overlap;
wire detected;

sequence_detector uut(
    clk,
    reset,
    data,
    overlap,
    detected
);

always #5 clk = ~clk;

task send;
    input d;
    begin
        data = d;
        #10;
    end
endtask

initial begin

    $dumpfile("dump.vcd");
    $dumpvars(0, tb);

    clk = 0;
    reset = 1;
    data = 0;
    overlap = 1;

    #10 reset = 0;

    // Overlapping sequence: 1101101
    send(1);
    send(1);
    send(0);
    send(1);
    send(1);
    send(0);
    send(1);

    #10;

    // Non-overlapping sequence
    reset = 1;
    #10 reset = 0;

    overlap = 0;

    send(1);
    send(1);
    send(0);
    send(1);
    send(1);
    send(0);
    send(1);

    #10;

    $finish;

end

endmodule