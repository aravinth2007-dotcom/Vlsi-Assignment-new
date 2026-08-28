module comparator(
    input [7:0] A, B,
    input signed_mode,
    output reg greater,
    output reg equal,
    output reg less
);

always @(*) begin
    greater = 0;
    equal = 0;
    less = 0;

    if(signed_mode) begin
        if($signed(A) > $signed(B))
            greater = 1;
        else if($signed(A) == $signed(B))
            equal = 1;
        else
            less = 1;
    end
    else begin
        if(A > B)
            greater = 1;
        else if(A == B)
            equal = 1;
        else
            less = 1;
    end
end

endmodule