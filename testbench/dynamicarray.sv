module dynamicarray;
int a[];
initial begin
    a = new [15];
    foreach (a[i])begin
        a[i] = i * i;

    end
    $display ("Array size = %0d",a.size());
    foreach (a[i]) begin
        $display ("a[%0d]= %0d", i, a[i]);

    end
    $finish;
end
    
endmodule
