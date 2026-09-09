module sensor_interface_module; // Module name: 'sensor_interface_module' (using '_module' suffix for clarity)
  // No ports - this module is self-contained and doesn't directly interact with other modules through ports

  // Internal register declaration to store sensor data
  logic [3:0] sensor_data_register; // 4-bit register to hold sensor readings

  // Example: Process to simulate sensor data update (for demonstration purposes)
  initial begin
    sensor_data_register = 4'b0000; //  Initialize sensor data at the start of simulation
    forever begin
      #10; // Wait for 10 time units (simulation time)
      sensor_data_register = $random(); // Update sensor data with a random value
    end
  end

  // Example: Display task to monitor sensor data (for demonstration purposes)
  task display_sensor_data;
    $display("[%0t] Sensor Data: %b", $time, sensor_data_register);
  endtask

  initial begin
    #5; // Wait a short time before starting data display
    forever begin
      #20; // Display sensor data every 20 time units
      display_sensor_data();
    end
  end
  
      // Stop simulation after 100 time units
  initial begin
    #100;
    $finish;
  end


endmodule // End of 'sensor_interface_module' module

