module fifo #(
    parameter int SIZE = 3,
    parameter int DATA_WIDTH = 16
) (
    input logic clk_i,
    input logic arst_ni,

    input  logic [DATA_WIDTH-1:0] data_in_i,
    input  logic                  data_in_valid_i,
    output logic                  data_in_ready_o,

    output logic [DATA_WIDTH-1:0] data_out_o,
    output logic                  data_out_valid_o,
    input  logic                  data_out_ready_i,

    output logic [SIZE:0] count_o
);

  logic [2**SIZE-1:0][DATA_WIDTH-1:0] mem;
  logic [     SIZE:0]                 wr_ptr;
  logic [     SIZE:0]                 rd_ptr;

  logic                               push;
  logic                               pop;

  always_comb data_in_ready_o = arst_ni ? ((count_o < (2 ** SIZE)) ? 'b1 : data_out_ready_i) : '0;
  always_comb data_out_valid_o = (count_o > 0);

  always_comb push = data_in_valid_i && data_in_ready_o;
  always_comb pop = data_out_valid_o && data_out_ready_i;

  always_comb data_out_o = mem[rd_ptr[SIZE-1:0]];
  always_comb count_o = wr_ptr - rd_ptr;

  always_ff @(posedge clk_i or negedge arst_ni) begin
    if (!arst_ni) begin
    end else if (push) begin
      mem[wr_ptr[SIZE-1:0]] <= data_in_i;
    end
  end

  always_ff @(posedge clk_i or negedge arst_ni) begin
    if (!arst_ni) begin
      wr_ptr <= '0;
    end else if (push) begin
      wr_ptr <= wr_ptr + 1'b1;
    end
  end

  always_ff @(posedge clk_i or negedge arst_ni) begin
    if (!arst_ni) begin
      rd_ptr <= '0;
    end else if (pop) begin
      rd_ptr <= rd_ptr + 1'b1;
    end
  end

endmodule
