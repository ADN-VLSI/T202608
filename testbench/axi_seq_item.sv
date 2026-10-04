class axi_seq_item;

  // Trasaction size shall be (2**SIZE) * (len + 1)
  //                               3        8

  // address shall be the multiple of 2^SIZE in case of wrap burst only
  // len shall be 1, 3, 7, 15 in case of wrap burst only
  // Transaction shall not cross 4KB boundary
  // burst shall be 0, 1, 2 only

  rand logic               tp;
  rand logic [   3:0]      id;
  rand logic [  31:0]      addr;   // TODO CONSTRAINT 
  rand logic [   7:0]      len;    // TODO CONSTRAINT
  rand logic [   2:0]      size;   // TODO CONSTRAINT
  rand logic [   1:0]      burst;  // TODO CONSTRAINT
  rand logic [4095:0][7:0] wdata;

  constraint c_burst {
    burst inside {[0:2]};
  }

endclass
