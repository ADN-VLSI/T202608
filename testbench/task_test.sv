module task_test;

  logic       clk   = '0;
  logic [7:0] data  = '0;
  logic       valid = '0;
  logic       ready = '0;

  /*
   * Simple ready/valid handshake between the sender and receiver:
   *
   *   sender                 receiver
   *     data   ------------->
   *     valid  ------------->  (receiver accepts data when valid is high)
   *     ready  <-------------  (sender may finish when ready is high)
   *
   * The sender holds valid high until the receiver raises ready. The
   * receiver holds ready high until valid is observed, so neither task
   * can complete before the other side is ready.
   */

  // Free-running 10 ns clock used to synchronize the handshake.
  always #5ns clk = ~clk;

  // Drive one data item and wait until the receiver accepts it.
  task automatic send_data(input int value);
    data  <= value;
    valid <= 1;
    do @(posedge clk); while (!ready);
    valid <= 0;
  endtask

  // Announce that the receiver is ready, then capture the data item.
  task automatic recv_data(output int value);
    ready <= 1;
    do @(posedge clk); while (!valid);
    ready <= 0;
    value = data;
  endtask

  // Configure waveform output and stop the simulation after a fixed timeout.
  initial begin
    $timeformat(-9, 0, "ns");
    $dumpfile("task_test.vcd");
    $dumpvars(0, task_test);

    #50ns;
    $finish;
  end

  // Start the sender after 10 ns so the receiver must wait for valid.
  initial begin
    #10ns;
    $display("[%0t] Starting data send...", $time);
    send_data(8'hA5);
    $display("[%0t] Sent data: 0x%0h", $time, 8'hA5);
  end

  // Start the receiver after 20 ns and report the captured value.
  initial begin
    int value;
    #20ns;
    $display("[%0t] Starting data receive...", $time);
    recv_data(value);
    $display("[%0t] Received data: 0x%0h", $time, value);
  end

endmodule
