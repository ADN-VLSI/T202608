module struct_unpacked;


  typedef struct {
    string name;
    int    id;
    bit    valid;
  } employee_t;

  employee_t emp;

  initial begin
    emp.name  = "Rahim";
    emp.id    = 101;
    emp.valid = 1'b1;

    $display("Name  = %s", emp.name);
    $display("ID    = %0d", emp.id);
    $display("Valid = %b", emp.valid);
  end

endmodule
