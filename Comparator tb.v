module tb;

reg [7:0] A, B;
reg signed_mode;
wire greater, equal, less;

comparator uut(A, B, signed_mode, greater, equal, less);

initial begin

    $dumpfile("dump.vcd");
    $dumpvars(0, tb);

    A = 8'd20;
    B = 8'd10;

    signed_mode = 1'b0;
    #10;

    signed_mode = 1'b1;
    #10;

    A = 8'hFF;
    B = 8'd1;

    signed_mode = 1'b0;
    #10;

    signed_mode = 1'b1;
    #10;

    A = 8'd50;
    B = 8'd50;

    signed_mode = 1'b0;
    #10;

    signed_mode = 1'b1;
    #10;

    $finish;
end

endmodule