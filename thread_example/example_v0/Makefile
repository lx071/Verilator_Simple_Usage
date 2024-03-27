all: compile

vsrc = top.v
csrc = sim_main.cpp

cflags = -lpthread -fopenmp
ldflags = -lpthread -fopenmp

vflags = $(if $(cflags),-CFLAGS "$(cflags)" ) $(if $(ldflags),-LDFLAGS "$(ldflags)" ) --cc --exe --Mdir verilator

vflags_extra = --trace

compile:
	verilator $(vflags) $(vflags_extra) $(csrc) $(vsrc)
	make -j -C verilator -f Vtop.mk

run:
	./verilator/Vtop

clean:
	-rm -rf verilator
