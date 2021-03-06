// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

class alert_handler_common_vseq extends alert_handler_base_vseq;
  `uvm_object_utils(alert_handler_common_vseq)

  rand bit entropy_bit;

  constraint num_trans_c {
    num_trans inside {[1:2]};
  }

  `uvm_object_new

  virtual task body();
    // driven entropy to avoid assertion error in ping_timer
    cfg.entropy_vif.drive(entropy_bit);
    run_common_vseq_wrapper(num_trans);
  endtask : body

endclass
