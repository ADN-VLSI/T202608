class axi_seq_item;

  logic               tp;
  logic [   3:0]      id;
  logic [  31:0]      addr;
  logic [   7:0]      len;
  logic [   2:0]      size;
  logic [   1:0]      burst;
  logic [4095:0][7:0] wdata;

endclass
