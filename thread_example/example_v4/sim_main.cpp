// DESCRIPTION: Verilator: Verilog example module
//
// This file ONLY is placed under the Creative Commons Public Domain, for
// any use, without warranty, 2017 by Wilson Snyder.
// SPDX-License-Identifier: CC0-1.0
//======================================================================

// Include common routines
#include <verilated.h>

// Include model header, generated from Verilating "top.v"
#include "VAdd.h"

#include <iostream>

using namespace std;

int main(int argc, char** argv) {
    // See a similar example walkthrough in the verilator manpage.

    // This is intended to be a minimal example.  Before copying this to start a
    // real project, it is better to start with a more complete example,
    // e.g. examples/c_tracing.

    // Construct a VerilatedContext to hold simulation time, etc.
    VerilatedContext* const contextp = new VerilatedContext;

    // Pass arguments so Verilated code can see them, e.g. $value$plusargs
    // This needs to be called before you create any model
    contextp->commandArgs(argc, argv);

    // Construct the Verilated model, from Vtop.h generated from Verilating "top.v"
    VAdd* const top = new VAdd{contextp};

    VlWide<4> data_a;
    VlWide<4> data_b;
    int sum;
    for(int i = 0; i < 10; i ++)
    {
        data_a.m_storage[0] = i % 100;

        // cout << "data_a:" << *data_a.data() << endl;
        top->a = data_a;
        // cout << "a = " << top->a << endl;

        data_b.m_storage[0] = (i + 1) % 100;

        // cout << "data_b:" << *data_b.data() << endl;
        top->b = data_b;
        // cout << "b = " << top->b << endl;
        
        top->cin = 1;
        // Evaluate model
        top->eval();
                
        cout << "a = " << *(top->a) << " b = " << *(top->b) << " cout:" << int(top->cout) << " sum:" << *(top->sum) << endl;
        // cout << "c = " << top->c << " d = " << top->d << " sum2:" << sum2 << endl;
        
    }


    // Final model cleanup
    top->final();

    // Destroy model
    delete top;

    // Return good completion status
    return 0;
}