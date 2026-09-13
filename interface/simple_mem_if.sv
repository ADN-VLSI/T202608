interface simple_mem_if #(
    parameter int ADDR_WIDTH = 8,
    parameter int DATA_WIDTH = 32
) (
    input logic arst_ni,
    input logic clk_i
);

  logic [ADDR_WIDTH-1:0] addr;
  wire  [DATA_WIDTH-1:0] data;
  logic                  rw;
  logic                  req;
  logic                  gnt;

  modport master(
      input arst_ni,
      input clk_i,
      output addr,
      inout data,
      output rw,
      output req,
      input gnt
  );

  modport slave(
      input arst_ni,
      input clk_i,
      input addr,
      inout data,
      input rw,
      input req,
      output gnt
  );

  modport monitor(
      input arst_ni,
      input clk_i,
      input addr,
      inout data,
      input rw,
      input req,
      input gnt
  );

  logic [DATA_WIDTH-1:0] data_reg;

  assign data = rw ? 'z : data_reg;

  function automatic reset(bit role = 1);
    if (role) begin
      addr <= '0;
      rw   <= '0;
      req  <= '0;
    end else begin
      gnt <= '0;
    end
  endfunction

  task automatic write(input logic [ADDR_WIDTH-1:0] _addr, input logic [DATA_WIDTH-1:0] _data);
    @(posedge clk_i);
    addr  <= _addr;
    data_reg <= _data;
    rw    <= '0;
    req   <= '1;
    do @(posedge clk_i); while (!gnt);
    req <= '0;
  endtask

  task automatic read(input logic [ADDR_WIDTH-1:0] _addr, output logic [DATA_WIDTH-1:0] _data);
    @(posedge clk_i);
    addr <= _addr;
    rw   <= '1;
    req  <= '1;
    do @(posedge clk_i); while (!gnt);
    req <= '0;
    _data = data;
  endtask

endinterface
