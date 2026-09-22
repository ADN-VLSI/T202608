module random;

logic [3:0] a, b;

initial begin
    repeat(10) begin
        a = $urandom_range(10,1);
        b = $urandom_range(5,1);
        #1;
        $display("a------> %d, b------> %d", a,b);
    end
end
endmodule