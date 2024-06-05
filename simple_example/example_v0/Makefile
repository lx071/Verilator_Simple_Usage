TOPLEVEL = top

vsrc = top.v
csrc = sim_main.cpp

objdir = obj_dir

.PHONY: all
all: V$(TOPLEVEL)

V${TOPLEVEL}:
	verilator -cc --exe --build -j $(vsrc) $(csrc)

.PHONY: run
run:
	./$(objdir)/V$(TOPLEVEL)

.PHONY: clean
clean:
	-rm -rf $(objdir)
