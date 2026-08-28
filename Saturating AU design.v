module saturating_arithmetic(
    input [7:0] A, B,
    input add_sub,
    output reg [7:0] Y
);

reg [8:0] temp;

always @(*) begin
    if(add_sub == 0) begin
        temp = A + B;

        if(temp > 255)
            Y = 8'hFF;
        else
            Y = temp[7:0];
    end
    else begin
        if(A < B)
            Y = 8'h00;
        else
            Y = A - B;
    end
end

endmodule