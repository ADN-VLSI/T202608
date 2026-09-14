module fifo #(
    parameter int DEPTH = 8,
    parameter int DATA_WIDTH = 16
)(
    input  logic                  clk_i,
    input  logic                  rst_n,

    input  logic [DATA_WIDTH-1:0] data_in_i,
    input  logic                  data_in_valid_i,
    output logic                  data_in_ready_o,

    output logic [DATA_WIDTH-1:0] data_out_o,
    output logic                  data_out_valid_o,
    input  logic                  data_out_ready_i,

    output logic [3:0]            count_o
);

  logic [DATA_WIDTH-1:0] mem [0:DEPTH-1];
  logic [2:0] wr_ptr;
  logic [2:0] rd_ptr;
  logic [3:0] count;

  logic push;
  logic pop;

  assign data_in_ready_o  = (count < DEPTH);
  assign data_out_valid_o = (count > 0);

  assign push = data_in_valid_i && data_in_ready_o;
  assign pop  = data_out_valid_o && data_out_ready_i;

  assign data_out_o = mem[rd_ptr];
  assign count_o = count;

  always_ff @(posedge clk_i or negedge rst_n) begin
    if (!rst_n) begin
      wr_ptr <= '0;
      rd_ptr <= '0;
      count  <= '0;
    end
    else begin
      if (push) begin
        mem[wr_ptr] <= data_in_i;

        if (wr_ptr == DEPTH-1)
          wr_ptr <= '0;
        else
          wr_ptr <= wr_ptr + 1'b1;
      end

      if (pop) begin
        if (rd_ptr == DEPTH-1)
          rd_ptr <= '0;
        else
          rd_ptr <= rd_ptr + 1'b1;
      end

      case ({push, pop})
        2'b10: count <= count + 1'b1;
        2'b01: count <= count - 1'b1;
        default: count <= count;
      endcase
    end
  end

endmodule
