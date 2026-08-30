module area;
  int a, b, t_area, s_area;

  function int tri_area(int a, b);
    return (0.5 * a * b);

  endfunction

  function int sq_area(int a);
    return (a ** 2);

  endfunction


  initial begin
    a=5;
    b=10;
    t_area = tri_area(a , b);
    $display("area of triangle Display ----------> (a = %d, b = %d): %d", a, b, t_area);

    a = 20;
    s_area = sq_area(a);
    $display("area of squre (a = %d,): %d", a, s_area);
    for (int i = 0; i < 10; i++) begin
      $display("area of squre (a = %d,): %d", i, sq_area(i));
    end
  end






endmodule
