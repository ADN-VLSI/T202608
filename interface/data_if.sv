interface data_if #(
    parameter int DATA_WIDTH = 16
) (
    input logic arst_ni,
    input logic clk_i
);

  logic [DATA_WIDTH-1:0] data;
  logic                  valid;
  logic                  ready;


  bit                    is_clk_aligned;

  always @(posedge clk_i or negedge arst_ni) begin
    if (!arst_ni) begin
      is_clk_aligned = 0;
    end else begin
      is_clk_aligned = 1;
      #1step;
      is_clk_aligned = 0;
    end
  end

  modport sender(output data, output valid, input ready);
  modport receiver(input data, input valid, output ready);
  modport monitor(input data, input valid, input ready);

  task automatic reset(input bit is_sender = 1);
    if (is_sender) begin
      valid <= '0;
    end else begin
      ready <= '0;
    end
  endtask

  task automatic send(input logic [DATA_WIDTH-1:0] d);
    if (arst_ni) begin
      wait (is_clk_aligned);
      data  <= d;
      valid <= '1;
      do @(posedge clk_i); while (!ready && arst_ni);
      valid <= '0;
    end
  endtask

  task automatic recv(output logic [DATA_WIDTH-1:0] d);
    if (arst_ni) begin
      wait (is_clk_aligned);
      ready <= '1;
      do @(posedge clk_i); while (!valid && arst_ni);
      ready <= '0;
      d = data;
    end
  endtask

  task automatic look(output logic [DATA_WIDTH-1:0] d);
    if (arst_ni) begin
      do @(posedge clk_i); while (arst_ni && !(valid && ready));
      d = data;
    end
  endtask

endinterface
