all: compile run

compile:
	verilator -cc --exe --build -j top.v sim_main.cpp

run:
	./obj_dir/Vtop

clean:
	-rm -rf obj_dir