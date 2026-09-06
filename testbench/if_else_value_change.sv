module if_else_value_change;
  parameter  THRESHOLD_HIGH = 70;
  parameter  THRESHOLD_MID  = 45;
  logic [9:0] data_value = 62;

  initial begin
    if (data_value > THRESHOLD_HIGH) begin
      $display("%0d: Data is HIGH (above %0d)", data_value, THRESHOLD_HIGH);
    end else if (data_value > THRESHOLD_MID) begin
      $display("%0d: Data is MEDIUM (between %0d and %0d)", data_value, THRESHOLD_MID + 1, THRESHOLD_HIGH); // Executes for data_value = 42
    end else begin
      $display("%0d: Data is LOW (at or below %0d)", data_value, THRESHOLD_MID);
    end
  end
endmodule