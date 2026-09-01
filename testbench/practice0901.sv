module practice0901;
    int a[3:0];

    initial begin
        $monitor ("a[0] = %0d, a[1] = %0d, a[2] = %0d, a[3] = %0d", a[0], a[1], a[2], a[3]);
        a[0] = 1;
        #1ns;
        a[1] = 2;
        #1ns;
        a[2] = 3;
        #1ns;
        a[3] = 4;
        #1ns;
        $finish;
    end
    

endmodule