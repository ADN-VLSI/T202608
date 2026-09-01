module struct_test;

`include "vip/sim_start_end.sv"

  // Packed struct (contiguous bits)
  typedef struct packed {
    logic [7:0]  addr;
    logic [31:0] data;
    logic        wr_en;
  } bus_pkt_t;

  // Unpacked struct (separate storage)
  typedef struct {
    string name;
    int    id;
    bit    valid;
  } employee_t;

  initial begin
    employee_t emp[3];

    emp[0] = '{name: "Alice", id: 1, valid: 1'b1};
    emp[1] = '{name: "Bob", id: 2, valid: 1'b1};
    emp[2] = '{name: "Charlie", id: 3, valid: 1'b0};

    foreach (emp[i]) begin
      $display("Employee %0d: name=%s, id=%0d, valid=%b", i, emp[i].name, emp[i].id, emp[i].valid);
    end

    $finish;

  end

endmodule
