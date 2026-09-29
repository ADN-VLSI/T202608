class numbers;

rand int odd_num;
rand int even_num; 


constraint chaity_atiya {
    odd_num inside {[1:500],[700:1000]};
    odd_num % 2 == 1;
    even_num inside {[1000:2000],[3000:4000]};
    even_num % 2 == 0;
}

endclass

module tb_numbers;

  numbers n;

  initial begin
     n = new();  

       repeat (10) begin
           if (!n.randomize() with {odd_num == 11;})$error("randomize failed");
               $display("odd_num = %0d, even_num = %0d",
                            n.odd_num, n.even_num);
          end
    end
     
endmodule