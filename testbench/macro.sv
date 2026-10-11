`include "pkg.sv"
`include "define.svh"
module macro;
import my_pkg::*;

int a,b;

initial begin
    $display("DATA_WIDTH: %d", DATA_WIDTH);
    print_val(100,200);
    a = 128;
    b = 200;

    $display("Max bet a and b: %d", `MAX(a,b));
    $display("Clog2 of A : %d", `LOG2(a));
    $display("This is line no : %d", `__LINE__);
    $display("file name : %s", `__FILE__);

end
endmodule