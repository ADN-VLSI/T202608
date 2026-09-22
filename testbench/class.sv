class triangle;

// data members
bit [3:0] a;
bit [3:0] b;

// methods

//  constraint rand_a {
//     a inside {2,5,8};
//   }


//// Constructor /////
function new(bit [3:0] a, bit [3:0] b);
    this.a = a;
    this.b = b;
    
endfunction

function automatic int area();
    return (0.5)*a*b;
endfunction

function automatic void display();
    $display("Value of a = %d", a);
    $display("Value of b = %d", b);
    $display("Value of area: %d", area());
endfunction
endclass


module class_prac;
    triangle tr;
    triangle tr1;


    initial begin
        tr = new(10,8);
        tr1 = new(5,10);
        tr.display();
        tr1.display();
        ////////////// 
        $display("--------------------Value for tr object-------------------");
        tr.a = 12;
        tr.b = 12;
        tr.display();
        ///////////
        $display("--------------------Value for tr1 object-------------------");
        tr1.a = 10;
        tr1.b = 11;
        tr1.display();

    end





endmodule