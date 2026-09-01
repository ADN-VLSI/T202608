module strobe;
    
    logic [3:0] x;
    logic [3:0] y;

    initial begin
        x = 2;
        y = 3;

        x <=  y;
        y <=  x;


        $strobe("x = %0b, y = %0b", x, y);
    end

endmodule    