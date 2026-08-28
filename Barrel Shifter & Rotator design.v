module barrel_shifter(
    input [7:0] data,
    input [2:0] shift,
    input [1:0] mode,
    output reg [7:0] y
);

always @(*) begin
    case(mode)
        2'b00: y = data << shift;
        2'b01: y = data >> shift;
        2'b10: y = (data << shift) | (data >> (8-shift));
        2'b11: y = (data >> shift) | (data << (8-shift));
    endcase
end

endmodule