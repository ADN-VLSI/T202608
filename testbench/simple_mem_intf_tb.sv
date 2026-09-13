module simple_mem_intf_tb;

  localparam int AW = 3;
  localparam int DW = 8;

  ctrl_if ctif ();

  simple_mem_if #(
      .ADDR_WIDTH(AW),
      .DATA_WIDTH(DW)
  ) smif (
      .arst_ni(ctif.arst_n),
      .clk_i  (ctif.clk)
  );

  simple_mem_intf u_dut (.intf(smif));

  task automatic apply_reset();
    #100ns;
    smif.reset();
    ctif.apply_reset();
    #100ns;
  endtask

  initial begin
    int rdata;

    $dumpfile("simple_mem_intf_tb.vcd");
    $dumpvars();
    $timeformat(-9, 0, "ns");

    apply_reset();
    ctif.start_clock();

    smif.write(0, 'h10);
    smif.write(1, 'h11);
    smif.write(2, 'h12);
    smif.write(3, 'h13);

    smif.read(0, rdata);
    smif.read(1, rdata);
    smif.read(2, rdata);
    smif.read(3, rdata);

    #100ns;
    $finish;
  end

endmodule
