SHELL=bash

vsrc = dut.sv
csrc = indep_clk.cpp
cflags = -lpthread
ldflags = -lpthread
objdir = obj
obj = $(csrc:%.cpp=%)
vflags = $(if $(cflags),-CFLAGS "$(cflags)" ) $(if $(ldflags),-LDFLAGS "$(ldflags)" ) --cc --exe --Mdir $(objdir) \
	 --top-module dut

vflags_extra = --trace
sflags =


.PHONY: help
help:
	@echo -e "Usage:\n\tmake [ooptions] [target] [<variable>=<value>]"
	@echo -e "\nTargets:"
	@echo -e "  help        prints this help message"
	@echo -e "  build       creates a testbench binary ($(objdir)/$(obj))"
	@echo -e "  clean       delete all outputs"
	@echo -e "\nVariables:"
	@echo -e "  cflags           extra C++ compiler flags"
	@echo -e ""

.PHONY: all build
all build: $(objdir)/$(obj)

.PHONY: verilate
verilate: $(objdir)/Vdut.mk

$(objdir)/Vdut.mk: $(vsrc) $(csrc)
	verilator $(vflags) $(vflags_extra) -o $(notdir $(obj)) $(csrc) $(vsrc)

$(objdir)/$(obj): $(objdir)/Vdut.mk
	make -C $(objdir) -f Vdut.mk

.PHONY: clean
clean:
	rm -rf $(objdir) dump.vcd