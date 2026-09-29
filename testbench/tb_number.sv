class packet;

  rand int odd_num;
  rand int even_num;

  constraint odd_num_c {
    odd_num inside {[1:500], [700:1000]};
    odd_num % 2 == 1;
  }

  constraint even_num_c {
    even_num inside {[1000:2000], [3000:4000]};
    even_num % 2 == 0;
  }

endclass


module tb_number;

  packet p;

  initial begin
    p = new();

    repeat (10) begin
      if (p.randomize())
        $display("odd_num = %0d, even_num = %0d",
                  p.odd_num, p.even_num);
      else
        $display("Randomization failed");
    end
  end

endmodule
