class animal;
   virtual function void speak();
        $display("Animal speaks");
    endfunction
endclass

class dog extends animal;
   virtual function void speak();
        super.speak(); // Call the base class method
        $display("Gheu Gheu");
    endfunction
endclass

class cat extends animal;
    virtual function void speak();
        super.speak(); // Call the base class method
        $display("meow meow");
    endfunction
endclass

module tb_animal;
    animal a; // Parent handle
    dog d;
    cat c;

    initial begin
        d = new();
        c = new();

        a = d; 
        a.speak(); // Output: Dog barks

        a = c; 
        a.speak(); // Output: Cat meows
    end
endmodule