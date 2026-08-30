export SHELL=/bin/bash

REPO_ROOT := $(CURDIR)

TOP := hello

BUILD_DIR := $(REPO_ROOT)/build
LOG_DIR := $(REPO_ROOT)/log

XVLOG_CMD += -sv
XVLOG_CMD += -i $(REPO_ROOT)/include
XVLOG_CMD += $(shell find $(REPO_ROOT)/source -name "*.sv")
XVLOG_CMD += $(shell find $(REPO_ROOT)/interface -name "*.sv")
XVLOG_CMD += $(shell find $(REPO_ROOT)/testbench -name "*.sv")

XVLOG ?= xvlog
XELAB ?= xelab
XSIM  ?= xsim

$(BUILD_DIR) $(LOG_DIR):
	@mkdir -p $@
	@echo "*" > $@/.gitignore

$(BUILD_DIR)/snap_$(TOP):
	@make -s $(BUILD_DIR)
	@make -s $(LOG_DIR)
	@cd $(BUILD_DIR) && $(XVLOG) $(XVLOG_CMD) -log $(LOG_DIR)/xvlog_$(shell date +%Y%m%d_%H%M%S).log
	@cd $(BUILD_DIR) && $(XELAB) $(TOP) -s snap_$(TOP) -debug all -log $(LOG_DIR)/xelab_$(TOP)_$(shell date +%Y%m%d_%H%M%S).log && (echo "" > $(BUILD_DIR)/snap_$(TOP))

.PHONY: simulate
simulate:
	@make -s $(LOG_DIR)
	@make -s $(BUILD_DIR)/snap_$(TOP)
	@cd $(BUILD_DIR) && $(XSIM) snap_$(TOP) -runall -log $(LOG_DIR)/xsim_$(TOP)_$(shell date +%Y%m%d_%H%M%S).log

.PHONY: clean
clean:
	@rm -rf $(BUILD_DIR)

.PHONY: clean_full
clean_full:
	@make -s clean
	@rm -rf $(LOG_DIR)
