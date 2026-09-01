module strobe;

    logic [3:0] a;
    logic [3:0] b;

    initial begin
        a = 5;
        b = 10;

        a <= b;
        b <= a ;

        $strobe("a=%b, b=%b", a, b);
    end

endmodule
