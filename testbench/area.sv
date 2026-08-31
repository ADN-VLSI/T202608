module area;

  int a, b, t_area;
  int s_area[0:9];

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

    for (int i = 0; i < 10; i++) begin
      s_area[i]= sq_area(i);
      $display("area of square (a = %d,): %d", i, s_area[i]);
    end
  end
   
endmodule
