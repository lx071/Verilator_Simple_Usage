all: compile run

compile:
	verilator --Wno-fatal -cc --exe --build -j Add.v sim_main.cpp

run:
	./obj_dir/VAdd

clean:
	-rm -rf obj_dir