module pwm_generator #(parameter WIDTH = 8)(
    input clk,
    input reset,
    input [WIDTH-1:0] duty,
    output pwm
);

reg [WIDTH-1:0] count;

always @(posedge clk or posedge reset) begin
    if(reset)
        count <= 0;
    else
        count <= count + 1;
end

assign pwm = (count < duty);

endmodule