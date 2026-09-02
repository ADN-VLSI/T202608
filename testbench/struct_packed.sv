module struct_packed;

  typedef struct packed {
    logic [7:0]  addr;
    logic [31:0] data;
    logic        wr_en;
  } bus_pkt_t;

  bus_pkt_t pkt;

  initial begin
    pkt.addr  = 8'hA5;
    pkt.data  = 32'h1234_5678;
    pkt.wr_en = 1'b1;

    $display("Address = %h", pkt.addr);
    $display("Data    = %h", pkt.data);
    $display("Write En = %b", pkt.wr_en);
  end

endmodule
