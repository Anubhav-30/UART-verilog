module uart_rx(
    input clk, rst, tick,
    input rx,
    output reg [7:0] data_out,
    output reg done
);

    reg [3:0] bit_cnt;
    reg [7:0] data_reg;
    reg receiving;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            receiving <= 0;
            done <= 0;
            data_out <= 0;   // 🔥 FIX
            data_reg <= 0;   // 🔥 FIX
            bit_cnt <= 0;
        end else begin
            done <= 0;

            if (!receiving && rx == 0) begin
                receiving <= 1;
                bit_cnt <= 0;
            end

            else if (receiving && tick) begin
                bit_cnt <= bit_cnt + 1;

                if (bit_cnt >= 1 && bit_cnt <= 8)
                    data_reg[bit_cnt-1] <= rx;

                if (bit_cnt == 9) begin
                    receiving <= 0;
                    data_out <= data_reg;
                    done <= 1;
                end
            end
        end
    end
endmodule