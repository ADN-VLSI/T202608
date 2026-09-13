module always_trigger_test;

  `include "vip/sim_start_end.sv"

  logic       clk = 0;

  always #5ns begin
    clk <= ~clk;
    $display("[%0d] inverting clock", $realtime);
  end

  always @(posedge clk) begin
    $display("[%0d] clock rose from 0 to 1", $realtime);
  end

  initial begin
    $timeformat(-9, 0, "ns");
    $dumpfile("always_trigger_test.vcd");
    $dumpvars(0, always_trigger_test);

    #50ns;
    $finish;
  end

endmodule
