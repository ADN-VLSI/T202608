
module simple_fifo #(
    parameter int DEPTH = 8,
    parameter int WIDTH = 16
) (
    input  logic             clk_i,
    input  logic             arst_ni,

    input  logic [WIDTH-1:0] data_in_i,
    input  logic             data_in_valid_i,
    output logic             data_in_ready_o,

    output logic [WIDTH-1:0] data_out_o,
    output logic             data_out_valid_o,
    input  logic             data_out_ready_i, 

    output logic [$clog2(DEPTH+1)-1:0] count_o
);

    localparam int PTR_WIDTH = $clog2(DEPTH);

    logic [WIDTH-1:0] mem [0:DEPTH-1];

    logic [PTR_WIDTH-1:0] wr_ptr;
    logic [PTR_WIDTH-1:0] rd_ptr;

    logic do_write;
    logic do_read;

    assign data_in_ready_o = (count_o < DEPTH);

    assign data_out_valid_o = (count_o != 0);

    assign data_out_o = mem[rd_ptr];

    assign do_write = data_in_valid_i && data_in_ready_o;

    assign do_read = data_out_valid_o && data_out_ready_i;

    always_ff @(posedge clk_i or negedge arst_ni) begin

        if (!arst_ni) begin
            wr_ptr  <= '0;
            rd_ptr  <= '0;
            count_o <= '0;

        end else begin

            if (do_write) begin
                mem[wr_ptr] <= data_in_i;

                if (wr_ptr == DEPTH-1)
                    wr_ptr <= '0;
                else
                    wr_ptr <= wr_ptr + 1'b1;
            end

            if (do_read) begin

                if (rd_ptr == DEPTH-1)
                    rd_ptr <= '0;
                else
                    rd_ptr <= rd_ptr + 1'b1;

            end

            case ({do_write, do_read})

                2'b10: begin
                    count_o <= count_o + 1'b1;
                end

                2'b01: begin
                    count_o <= count_o - 1'b1;
                end

                2'b11: begin
                    count_o <= count_o;
                end

                default: begin
                    count_o <= count_o;
                end

            endcase

        end

    end

endmodule



