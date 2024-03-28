all: compile_1 compile_2

CXXFLAGS = -O3 -Wall -std=c++17 -no-pie
VERILATOR_ROOT ?= $(shell verilator -getenv VERILATOR_ROOT)
INCLUDE_FLAGS = -I./obj_dir -I${VERILATOR_ROOT}/include/
LDFLAGS = ./obj_dir/Vtop__ALL.a -pthread -lpthread -latomic

# Get Vtop__ALL.a, Vtop.h
compile_1:
	verilator -cc --build top.v

compile_2: $(VERILATOR_ROOT)/include/verilated.cpp $(VERILATOR_ROOT)/include/verilated_vcd_c.cpp $(VERILATOR_ROOT)/include/verilated_threads.cpp
	g++ sim_main.cpp ${INCLUDE_FLAGS} ${LDFLAGS} $^ -o Vtop

run:
	./Vtop

clean:
	-rm -rf obj_dir Vtop
