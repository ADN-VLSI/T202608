module case_example_2;

  typedef enum logic [2:0] {
    RED,
    GREEN,
    BLUE
  } color_e;

  color_e color = GREEN;

  initial begin
    case (color)
      RED:   $display("Color is RED");
      GREEN: $display("Color is GREEN");
      BLUE:  $display("Color is BLUE");
      default: $display("Invalid color");
    endcase
  end

endmodule
