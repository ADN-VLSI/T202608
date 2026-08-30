module hello;

  `include "vip/sim_start_end.sv"

  dummy_rtl u_dut ();

  initial begin
    $display("Hello, World!");
    $finish;
  end

endmodule
