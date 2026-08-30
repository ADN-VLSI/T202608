module area;
  int a, b, t_area, s_area;

  function int tri_area(input int a, b);
    return (0.5 * a * b);

  endfunction

  function int squ_area(input int a);
    return (a ** 2);

  endfunction

initial begin
    a = 5;
    b = 2;
    t_area = tri_area(a,b);
    $display("Area of triangle (a = %0d, b = %0d):%d", a,b,t_area);

    a = 4;
    s_area = squ_area(a);
    $display("Area of square (a =%d):%d", a,s_area);

end


endmodule
