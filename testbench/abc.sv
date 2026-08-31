module abc;

    int a [10];

    initial begin

        for (int i = 0; i < 10; i++) begin
            a[i] = i*i;
        end

        for (int i = 0; i < 10; i++) begin
            $display("a[%0d]:%0d", i, a[i]);
        end

        $finish;

    end

endmodule
