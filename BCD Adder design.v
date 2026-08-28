module bcd_adder(
    input [3:0] A, B,
    input cin,
    output reg [3:0] sum,
    output reg cout
);

reg [4:0] temp;

always @(*) begin
    temp = A + B + cin;

    if(temp > 9) begin
        temp = temp + 6;
        cout = 1;
    end
    else begin
        cout = 0;
    end

    sum = temp[3:0];
end

endmodule