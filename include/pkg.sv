`ifndef __PKG_GUARD__
`define  __PKG_GUARD__ 0 

package my_pkg;

    localparam MEM_DEPTH = 8;
    localparam DATA_WIDTH = 8;


    typedef logic [DATA_WIDTH-1:0] mem_data_t;


    function void print_val(int a , int b);
        $display("Value of a = %0d || b = %0d",a,b);
    endfunction

endpackage
`endif