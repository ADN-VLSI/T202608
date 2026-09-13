module simple_mem #(
    parameter int ADDR_WIDTH = 8,
    parameter int DATA_WIDTH = 32
) (
    input logic arst_ni,
    input logic clk_i,

    input  logic [ADDR_WIDTH-1:0] addr,
    inout  wire  [DATA_WIDTH-1:0] data,
    input  logic                  rw,
    input  logic                  req,
    output logic                  gnt
);

  logic [DATA_WIDTH-1:0] mem[2**ADDR_WIDTH];

  logic [DATA_WIDTH-1:0] my_data;

  assign data = rw ? my_data : 'z;

  always_ff @(posedge clk_i or negedge arst_ni) begin
    if (~arst_ni) begin
      foreach (mem[i]) mem[i] <= '0;
    end else if (~rw) begin
      mem[addr] <= data;
    end
  end

  always_comb my_data = mem[addr];

  always_ff @(posedge clk_i or negedge arst_ni) begin
    if (~arst_ni) begin
      gnt <= '0;
    end else begin
      gnt <= $urandom;
    end
  end

endmodule
