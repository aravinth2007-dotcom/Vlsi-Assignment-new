module tb;

reg [7:0] A, B;
reg add_sub;
wire [7:0] Y;

saturating_arithmetic uut(A, B, add_sub, Y);

initial begin

    $dumpfile("dump.vcd");
    $dumpvars(0, tb);

    A = 8'd200;
    B = 8'd100;
    add_sub = 1'b0;
    #10;

    A = 8'd50;
    B = 8'd100;
    add_sub = 1'b1;
    #10;

    A = 8'd100;
    B = 8'd50;
    add_sub = 1'b1;
    #10;

    A = 8'd100;
    B = 8'd50;
    add_sub = 1'b0;
    #10;

    A = 8'd255;
    B = 8'd1;
    add_sub = 1'b0;
    #10;

    $finish;
end

endmodule