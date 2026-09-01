module practice;

  logic a, b, c;
  
  initial begin
    $monitor("a=%b, b=%b, c=%b", a, b, c);

    a = 0;
    b = 0;
    c = 0;
    #10 a = 1;
    #10 b = 1;
    #10 c = 1;
    $finish;


  end

endmodule
