verilator -cc top.v  
> generate *.h, *.cpp, *.mk

verilator -cc --build top.v  
> generate *.h, *.cpp, *.mk  
> generate Vtop__ALL.cpp, Vtop__ALL.o, Vtop__ALL.a  

verilator --cc --exe top.v sim_main.cpp  
> generate *.h, *.cpp, *.mk

verilator --cc --exe --build top.v sim_main.cpp  
> generate *.h, *.cpp, *.mk  
> generate sim_main.o, verilated.o, verilated_threads.o, Vtop__ALL.cpp, Vtop__ALL.o, Vtop__ALL.a, Vtop  



--cc, to get C++ output.  
--exe, along with our sim_main.cpp wrapper file, so the build will create an executable instead of only a library.  
--build, so Verilator will call make itself. This is we don’t need to manually call make as a separate step. You can also write your own compile rules, and run make yourself.  
-j 0, to Verilate using use as many CPU threads as the machine has.  
-Wall, so Verilator has stronger lint warnings enabled.  

