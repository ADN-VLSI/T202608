`include "pkg.sv"
module macro1;
import my_pkg::*;

initial begin
    $display("DATA_WIDTH: %d", DATA_WIDTH);
    print_val(100,200);



end
endmodule