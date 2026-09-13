module simple_mem_tb;

  localparam int AW = 3;
  localparam int DW = 8;

  logic          arst_n;
  logic          clk;

  logic [AW-1:0] tb_addr;
  wire  [DW-1:0] tb_data;
  logic          tb_rw;
  logic          tb_req;
  logic          tb_gnt;

  logic [DW-1:0] data_reg;

  assign tb_data = tb_rw ? 'z : data_reg;

  simple_mem #(
      .ADDR_WIDTH(AW),
      .DATA_WIDTH(DW)
  ) u_dut (
      .arst_ni(arst_n),
      .clk_i  (clk),
      .addr   (tb_addr),
      .data   (tb_data),
      .rw     (tb_rw),
      .req    (tb_req),
      .gnt    (tb_gnt)
  );

  task automatic apply_reset();
    #100ns;
    arst_n   <= '0;
    clk      <= '0;
    tb_addr  <= '0;
    tb_rw    <= '0;
    tb_req   <= '0;
    data_reg <= '0;
    #100ns;
    arst_n <= '1;
    #100ns;
  endtask

  task automatic start_clock();
    fork
      forever begin
        clk <= '1;
        #5ns;
        clk <= '0;
        #5ns;
      end
    join_none
    @(posedge clk);
  endtask

  task automatic write(input int addr, input int data);
    @(posedge clk);
    tb_addr  <= addr;
    data_reg <= data;
    tb_rw    <= '0;
    tb_req   <= '1;
    do @(posedge clk); while (!tb_gnt);
    tb_req <= '0;
  endtask

  task automatic read(input int addr, output int data);
    @(posedge clk);
    tb_addr <= addr;
    tb_rw   <= '1;
    tb_req  <= '1;
    do @(posedge clk); while (!tb_gnt);
    tb_req <= '0;
    data = tb_data;
  endtask

  initial begin
    int rdata;

    $dumpfile("simple_mem_tb.vcd");
    $dumpvars();
    $timeformat(-9, 0, "ns");

    apply_reset();
    start_clock();

    write(0, 'h10);
    write(1, 'h11);
    write(2, 'h12);
    write(3, 'h13);

    read(0, rdata);
    read(1, rdata);
    read(2, rdata);
    read(3, rdata);

    #100ns;
    $finish;
  end

endmodule
