module enum_test;

  typedef enum logic [1:0] {
    IDLE  = 2'b00,
    READ  = 2'b01,
    WRITE = 2'b10,
    ERROR = 2'b11
  } state_t;

  state_t state;

  initial begin

    state = IDLE;
    $display("State = %s, Binary = %b", state.name(), state);

    state = READ;
    $display("State = %s, Binary = %b", state.name(), state);

    state = WRITE;
    $display("State = %s, Binary = %b", state.name(), state);

    state = ERROR;
    $display("State = %s, Binary = %b", state.name(), state);

  end

endmodule

