module always_test;

  `include "vip/sim_start_end.sv"

  logic       arst_n = 1;
  logic       clk = 0;
  logic       en = 0;

  logic [3:0] a;  // random num #3ns
  logic [3:0] b;  // random num #7ns
  logic [3:0] c;  // comb sum
  logic [3:0] d;  // ff sum
  logic [3:0] e;  // latch sum

  always begin
    arst_n = '1;
    #49ns;
    arst_n = '0;
    #1ns;
  end

  always #5ns begin
    clk <= ~clk;
  end

  always #11ns begin
    en <= ~en;
  end

  always #3ns a = $urandom;
  always #7ns b = $urandom;

  always_comb c = a + b;

  always_ff @(posedge clk or negedge arst_n) begin
    if (!arst_n) d <= '0;
    else if (en) d <= a + b;
  end

  always_latch begin
    if (en) e = a + b;
  end

  initial begin
    $timeformat(-9, 0, "ns");
    $dumpfile("always_test.vcd");
    $dumpvars(0, always_test);

    #1us;
    $finish;
  end

endmodule
