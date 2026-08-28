module sequence_detector(
    input clk,
    input reset,
    input data,
    input overlap,
    output reg detected
);

reg [2:0] state;

localparam S0 = 3'b000;
localparam S1 = 3'b001;
localparam S2 = 3'b010;
localparam S3 = 3'b011;

always @(posedge clk or posedge reset) begin

    if(reset) begin
        state <= S0;
        detected <= 0;
    end
    else begin
        detected <= 0;

        case(state)

            S0: begin
                if(data)
                    state <= S1;
                else
                    state <= S0;
            end

            S1: begin
                if(data)
                    state <= S2;
                else
                    state <= S0;
            end

            S2: begin
                if(data)
                    state <= S2;
                else
                    state <= S3;
            end

            S3: begin
                if(data) begin
                    detected <= 1;

                    if(overlap)
                        state <= S1;
                    else
                        state <= S0;
                end
                else
                    state <= S0;
            end

        endcase
    end

end

endmodule