module uart_tb;

    reg clk;
    reg rst;
    reg tx_start;
    reg [7:0] data_in;

    wire [7:0] data_out;
    wire done;
    wire tx;

    always #5 clk = ~clk;

    uart_top DUT (
        .clk(clk),
        .rst(rst),
        .tx_start(tx_start),
        .data_in(data_in),
        .data_out(data_out),
        .done(done),
        .tx(tx)
    );

    initial begin
        $dumpfile("uart.vcd");
        $dumpvars(0, uart_tb);

        clk = 0;
        rst = 1;
        tx_start = 0;
        data_in = 8'h00;

        #50 rst = 0;

        #20 data_in = 8'hF0;

        // 🔥 HOLD START LONGER
        tx_start = 1;
        #100;
        tx_start = 0;

        #5000 $finish;
    end

endmodule