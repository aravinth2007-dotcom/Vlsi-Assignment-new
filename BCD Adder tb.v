module tb;

reg [3:0] A, B;
reg cin;
wire [3:0] sum;
wire cout;

bcd_adder uut(A, B, cin, sum, cout);

initial begin

    $dumpfile("dump.vcd");
    $dumpvars(0, tb);

    A = 4'd4;
    B = 4'd5;
    cin = 1'b0;
    #10;

    A = 4'd7;
    B = 4'd8;
    cin = 1'b0;
    #10;

    A = 4'd9;
    B = 4'd9;
    cin = 1'b0;
    #10;

    A = 4'd5;
    B = 4'd6;
    cin = 1'b1;
    #10;

    $finish;
end

endmodule