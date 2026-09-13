module simple_mem_intf (
    simple_mem_if.slave intf
);

  logic [intf.DATA_WIDTH-1:0] mem[2**intf.ADDR_WIDTH];

  logic [intf.DATA_WIDTH-1:0] my_data;

  assign intf.data = intf.rw ? my_data : 'z;

  always_ff @(posedge intf.clk_i or negedge intf.arst_ni) begin
    if (~intf.arst_ni) begin
      foreach (mem[i]) mem[i] <= '0;
    end else if (~intf.rw) begin
      mem[intf.addr] <= intf.data;
    end
  end

  always_comb my_data = mem[intf.addr];

  always_ff @(posedge intf.clk_i or negedge intf.arst_ni) begin
    if (~intf.arst_ni) begin
      intf.gnt <= '0;
    end else begin
      intf.gnt <= $urandom;
    end
  end

endmodule
