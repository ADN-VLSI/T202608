// 1. Abstract Base Class
virtual class shape;
  pure virtual function void draw();
endclass

// 2. Circle Subclass
class circle extends shape;
  virtual function void draw();
    $display("Drawing a circle");
  endfunction
endclass

// 3. Square Subclass
class square extends shape;
  virtual function void draw();
    $display("Drawing a square");
  endfunction
endclass

// 4. Triangle Subclass (Renamed from 'triangle' to avoid keyword clash)
class tri_shape extends shape;
  virtual function void draw();
    $display("Drawing a triangle");
  endfunction
endclass

// 5. Testbench Module
module tb_shape;
  shape s;       // Parent handle
  circle c;
  tri_shape t;   // Renamed class type
  square q;

  initial begin
    c = new();   // Default constructor called without arguments
    t = new();
    q = new();

    s = c; 
    s.draw(); 
    
    s = t; 
    s.draw();     
    
    s = q; 
    s.draw();
  end
endmodule
