module uart_tx(
    input clk, rst, tick,
    input start,
    input [7:0] data_in,
    output reg tx,
    output reg busy
);

    reg [3:0] bit_cnt;
    reg [9:0] shift;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            tx <= 1;
            busy <= 0;
        end else begin
            if (start && !busy) begin
                shift <= {1'b1, data_in, 1'b0};
                busy <= 1;
                bit_cnt <= 0;
            end
            else if (busy && tick) begin
                tx <= shift[0];
                shift <= shift >> 1;
                bit_cnt <= bit_cnt + 1;

                if (bit_cnt == 9) begin
                    busy <= 0;
                    tx <= 1;
                end
            end
        end
    end
endmodule