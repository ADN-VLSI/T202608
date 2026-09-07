module case_example;
  typedef enum logic [3:0] { MONDAY=1, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY, SUNDAY, INVALID_DAY } day_e;
  day_e current_day = WEDNESDAY; // Assuming WEDNESDAY maps to 3'd3

  initial begin
    case (current_day)
      MONDAY:    $display("It's Monday");
      TUESDAY:   $display("It's Tuesday");
      WEDNESDAY: $display("It's Wednesday!"); // Matches: current_day is WEDNESDAY
      THURSDAY:  $display("It's Thursday");
      FRIDAY:    $display("It's Friday");
      SATURDAY:  $display("It's Saturday");
      SUNDAY:    $display("It's Sunday");
      default:   $display("Invalid day value!"); // Handles unexpected or uninitialized values
    endcase
  end
endmodule
