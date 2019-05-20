# Verilator Simple Usage

Use Decoder.v as an example. Use File I/O to get input data.

## Generate executable file

```bash
$ verilator -Wall --cc Decoder.v --exe Decoder_Sim.cpp --trace
$ make -j -C ./obj_dir -f Decoder.mk Decoder
```

## Generate .vcd file

```bash
$ ./obj_dir/VDecoder
```

Use gtkwave to view the wave.