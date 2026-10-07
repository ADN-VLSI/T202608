class axi_seq_item;

  rand logic               tp;
  rand logic [   3:0]     id;
  rand logic [  31:0]     addr;
  rand logic [   7:0]     len;
  rand logic [   2:0]     size;
  rand logic [   1:0]     burst;
  rand logic [4095:0][7:0] wdata;


  // 0 = FIXED
  // 1 = INCR
  // 2 = WRAP
  constraint c_burst {
    burst inside {0, 1, 2};
  }


  // 64-bit data bus -> maximum 8 bytes per beat
  constraint c_size {
    size inside {[0:3]};
  }


  // Burst length
  constraint c_len {
    len <= 15;

    // WRAP burst length can only be
    // 2, 4, 8, or 16 beats
    if (burst == 2) {
      len inside {1, 3, 7, 15};
    }
  }


  // Address alignment
  constraint c_addr {
    // All bursts must be aligned to the transfer size
    addr % (1 << size) == 0;

    // Additional WRAP alignment
    if (burst == 2) {
      addr % ((len + 1) * (1 << size)) == 0;
    }
  }


  // 4KB boundary constraint
  constraint c_4kb {

    if (burst == 0) {
      // FIXED: address doesn't increment,
      // so only one transfer needs to fit.
      (addr % 4096) + (1 << size) <= 4096;
    }

    else {
      // INCR and WRAP:
      // total transaction size must fit in 4KB.
      (addr % 4096) +
      ((int'(len) + 1) * (1 << size)) <= 4096;
    }
  }


  function automatic void print();

    $display(
      "tp = %0d, id = %0d, addr = %0d, len = %0d, size = %0d, burst = %0d",
      tp, id, addr, len, size, burst
    );

  endfunction

endclass


module tb;

  axi_seq_item ax;

  initial begin

    ax = new();

    repeat (10) begin

      if (!ax.randomize()) begin
        $error("Randomization failed");
      end

      ax.print();

    end

  end

endmodule
