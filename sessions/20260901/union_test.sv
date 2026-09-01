module union_test;

  `include "vip/sim_start_end.sv"

  typedef union packed {
    logic [31:0]      word_mem;
    logic [1:0][15:0] half_mem;
    logic [3:0][7:0]  byte_mem;
  } data_u;


  initial begin

    data_u u;

    u = 'h12_34_56_78;

    $display("Word memory: 0x%08h", u.word_mem);
    $display("Half memory: 0x%04h 0x%04h", u.half_mem[1], u.half_mem[0]);
    $display("Byte memory: 0x%02h 0x%02h 0x%02h 0x%02h", u.byte_mem[3], u.byte_mem[2], u.byte_mem[1], u.byte_mem[0]);

    $finish;

  end

endmodule
