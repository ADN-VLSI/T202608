module math2_test;

  initial begin

    automatic int a = 5;
    automatic int b = 0;

    b = a++;

    $display("a:%0d b:%0d", a, b);

    b = ++a;

    $display("a:%0d b:%0d", a, b);

    b += a; // b = b + a;

    $display("a:%0d b:%0d", a, b);
    
    b /= a; // b = b / a;

    $display("a:%0d b:%0d", a, b);
    
    $finish;
  end

endmodule

