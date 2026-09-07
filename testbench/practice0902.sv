module practice0902;

  // Enum type
  typedef enum logic [2:0] {
    IDLE  = 3'b000,
    READ  = 3'b001,
    WRITE = 3'b010,
    ERROR = 3'b111
  } state_t;

  // Variable of enum type
  state_t state;

  initial begin

    state = IDLE;
    $display("State = %s, Value = %b", state.name(), state);

    state = READ;
    $display("State = %s, Value = %b", state.name(), state);

    state = WRITE;
    $display("State = %s, Value = %b", state.name(), state);

    state = ERROR;
    $display("State = %s, Value = %b", state.name(), state);

    $finish;

  end

endmodule
