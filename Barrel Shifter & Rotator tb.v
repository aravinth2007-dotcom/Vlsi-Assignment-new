module tb;

reg [7:0] data;
reg [2:0] shift;
reg [1:0] mode;
wire [7:0] y;

barrel_shifter uut(data, shift, mode, y);

initial begin

    $dumpfile("dump.vcd");
    $dumpvars(0, tb);

    data = 8'b10110011;
    shift = 3'd2;

    mode = 2'b00; #10;
    mode = 2'b01; #10;
    mode = 2'b10; #10;
    mode = 2'b11; #10;

    $finish;
end

endmodule