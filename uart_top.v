module uart_top(
    input clk, rst,
    input tx_start,
    input [7:0] data_in,
    output [7:0] data_out,
    output done,
    output tx
);

    wire tick;
    wire rx;

    assign rx = tx;

    baud_gen BG (.clk(clk), .rst(rst), .tick(tick));

    uart_tx TX (
        .clk(clk),
        .rst(rst),
        .tick(tick),
        .start(tx_start),   // 🔥 DIRECT CONTROL
        .data_in(data_in),
        .tx(tx),
        .busy()
    );

    uart_rx RX (
        .clk(clk),
        .rst(rst),
        .tick(tick),
        .rx(rx),
        .data_out(data_out),
        .done(done)
    );

endmodule