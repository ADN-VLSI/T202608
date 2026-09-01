module math_test;

  initial begin
    logic [7:0] a = -5;
    logic [7:0] b = 2;
    logic [7:0] div;

    div = a / b;
    $display("div of %0d and %0d is %0d", a, b, div);

    $finish;
  end

endmodule
