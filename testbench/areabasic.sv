 module areabasic;

    int a[15];

    initial begin

        for (int i = 0; i < 15; i++) begin
            a[i] = i * i;
        end

//$display("Array size = %0d", a.size());

        foreach (a[i]) begin
            $display("a[%0d]:%0d", i, a[i]);
        end

        $finish;
    end

endmodule
