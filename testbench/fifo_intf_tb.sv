module fifo_intf_tb #(
    parameter WIDTH = 16,
    parameter DEPTH = 8
)(
    fifo_if fifo
);

    logic [WIDTH-1:0] mem [0:DEPTH-1];

    logic [$clog2(DEPTH)-1:0] wr_ptr;
    logic [$clog2(DEPTH)-1:0] rd_ptr;

    logic [$clog2(DEPTH+1)-1:0] count;


    assign fifo.full  = (count == DEPTH);
    assign fifo.empty = (count == 0);

    assign fifo.dout = mem[rd_ptr];


    always_ff @(posedge fifo.clk or negedge fifo.rst_n) begin

        if (!fifo.rst_n) begin

            wr_ptr <= '0;
            rd_ptr <= '0;
            count  <= '0;

        end

        else begin

            // Write operation
            if (fifo.wr_en && !fifo.full) begin

                mem[wr_ptr] <= fifo.din;
                wr_ptr <= wr_ptr + 1'b1;

            end


            // Read operation
            if (fifo.rd_en && !fifo.empty) begin

                rd_ptr <= rd_ptr + 1'b1;

            end


            // Count update
            case ({fifo.wr_en && !fifo.full,
                   fifo.rd_en && !fifo.empty})

                2'b10: count <= count + 1'b1;

                2'b01: count <= count - 1'b1;

                default: count <= count;

            endcase

        end

    end

endmodule
