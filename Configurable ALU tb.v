module tb;

reg [7:0] A, B;
reg [2:0] op;
wire [7:0] Y;
wire carry;

alu uut(A, B, op, Y, carry);

initial begin

    $dumpfile("dump.vcd");
    $dumpvars(0, tb);

    A = 8'd20;
    B = 8'd10;

    op = 3'b000; #10;
    op = 3'b001; #10;
    op = 3'b010; #10;
    op = 3'b011; #10;
    op = 3'b100; #10;
    op = 3'b101; #10;
    op = 3'b110; #10;
    op = 3'b111; #10;

    $finish;
end

endmodule