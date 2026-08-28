module alu #(parameter WIDTH = 8)(
    input  [WIDTH-1:0] A, B,
    input  [2:0] op,
    output reg [WIDTH-1:0] Y,
    output reg carry
);

always @(*) begin
    carry = 0;

    case(op)
        3'b000: {carry,Y} = A + B;
        3'b001: {carry,Y} = A - B;
        3'b010: Y = A & B;
        3'b011: Y = A | B;
        3'b100: Y = A ^ B;
        3'b101: Y = ~A;
        3'b110: Y = A << 1;
        3'b111: Y = A >> 1;
    endcase
end

endmodule