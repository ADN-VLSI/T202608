module enum_test;

  enum logic [1:0] {
    RED,
    YELLOW = 1,
    GREEN
  } current_state;


  initial begin
    current_state = RED;
    $display("Current state: %0d, [%s]", current_state, current_state.name);
    current_state = GREEN;
    $display("Current state: %0d, [%s]", current_state, current_state.name);
    current_state = YELLOW;
    $display("Current state: %0d, [%s]", current_state, current_state.name);
    current_state = RED;
    $display("Current state: %0d, [%s]", current_state, current_state.name);
    $finish;
  end

endmodule
