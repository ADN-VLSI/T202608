class wheel;

  string   brand;
  protected rand int radius;
  protected rand int width;

  constraint c_radius {
    radius >= 6;
    radius <= 18;
  }

  constraint c_width {
    width >= 4;
    width <= 10;
  }

  function new(string b = "no name");
    brand = b;
    this.randomize();
  endfunction

  virtual function print();
    $display("Brand: %s, Radius: %0d, Width: %0d", brand, radius, width);
  endfunction

  virtual function void inflate();
    width += 1;
    radius += 1;
  endfunction

  virtual function void deflate();
    width -= 1;
    radius -= 1;
  endfunction

  virtual function print_unique_class_name();
    $display("This is a generic wheel.");
  endfunction

endclass

class bus_wheel extends wheel;

  function new();
    super.new("Bus Wheel");
  endfunction

  virtual function print_unique_class_name();
    $display("This is a bus wheel.");
  endfunction

endclass

class truck_wheel extends wheel;

  function new();
    super.new("Truck Wheel");
  endfunction

  virtual function print_unique_class_name();
    $display("This is a truck wheel.");
  endfunction

endclass




module class_test;

  initial begin
    wheel       wheels[2];
    bus_wheel   w1;
    truck_wheel w2;

    w1 = new();
    w2 = new();

    wheels[0] = w1;
    wheels[1] = w2;

    wheels[0].radius = 1000;

    for (int i = 0; i < 2; i++) begin
      wheels[i].print();
      wheels[i].print_unique_class_name();
    end

    $finish;
  end

endmodule
