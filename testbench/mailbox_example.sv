module mailbox_example;

  mailbox data_mbox;
  mailbox #(integer) bounded_mbox = new(10);
  mailbox #(string) string_mbox = new(3);

  initial begin
    data_mbox = new();

    bounded_mbox.put(10);
    bounded_mbox.put(20);
    bounded_mbox.put(30);

    string_mbox.put("Hello");
    string_mbox.put("SystemVerilog");

    $display("Integer mailbox messages = %0d", bounded_mbox.num());
    $display("String mailbox messages = %0d", string_mbox.num());
  end

endmodule


