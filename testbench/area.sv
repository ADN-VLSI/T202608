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
    a = 5;
    b = 2;
    t_area = tri_area(a,b);
    $display("Area of triangle (a = %0d, b = %0d): %0d", a, b, t_area);
    
    for (int i = 0; i < 10; i++) begin
      s_area[i] = sq_area(i);
      $display("Area of square (a = %0d,): %0d", i, s_area[i]);
    end
  end

endmodule
