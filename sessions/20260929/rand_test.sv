module rand_test;

  initial begin

    repeat (10) begin
      int out_freq;
      int in_freq;
      int fb_div;
      int ref_div;

      std::randomize(
          in_freq, fb_div, ref_div
      ) with {
        in_freq inside {8, 16, 32, 64, 100};
        fb_div inside {[16 : 511]};
        ref_div inside {[1 : 15]};
        in_freq * fb_div >= 1 * ref_div;
        in_freq * fb_div <= 2000 * ref_div;
      };

      out_freq = in_freq * fb_div / ref_div;

      $display("out_freq = %0d, in_freq = %0d, fb_div = %0d, ref_div = %0d", out_freq, in_freq,
               fb_div, ref_div);

    end

  end

endmodule


/*

Input_ranges
-----------------------------
in_freq = 8, 16, 32, 64, 100
fb_div  = 16-511
ref_div = 1 - 15

Relation
-------------------------------------
out_freq = in_freq * fb_div / ref_div

Output_range
-------------------
out_freq = 1 - 2000




*/