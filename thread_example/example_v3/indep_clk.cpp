#include <iostream>
#include <omp.h>
#include <unistd.h>
#include "Vdut.h"
#include <verilated.h>

using namespace std;

struct th_arg {
    int id;
    omp_lock_t* lock;
    Vdut* top;
    int* simtime;
};

omp_lock_t lock_p;

void sys_clk(void* arg) {
    struct th_arg* a = (th_arg*)arg;
    int done = 0;
    int* simtime = a->simtime;
    int cnt = 0;

    omp_set_lock(a->lock);
    cout << "id " << a->id << ": System clock started ..." << endl;
    omp_unset_lock(a->lock);

    while (!done) {
        cnt++;
        omp_set_lock(a->lock);
        if (!Verilated::gotFinish()) {
            cout << "id " << a->id << ": System clock " << cnt << " ..." << endl;
            a->top->sys_clk = 1;
            a->top->eval();
            (*simtime)++;
            a->top->sys_clk = 0;
            a->top->eval();
            (*simtime)++;
        } else {
            done = 1;
        }
        omp_unset_lock(a->lock);

        sleep(2);
    }

    omp_set_lock(a->lock);
    cout << "id " << a->id << ": Finished ..." << endl;
    omp_unset_lock(a->lock);
}

void othr_clk(void* arg) {
    struct th_arg* a = (th_arg*)arg;
    int done = 0;
    int* simtime = a->simtime;
    int cnt = 0;

    omp_set_lock(a->lock);
    cout << "id " << a->id << ": Other clock started ..." << endl;
    omp_unset_lock(a->lock);

    while (!done) {
        cnt++;
        omp_set_lock(a->lock);
        if (!Verilated::gotFinish()) {
            cout << "id " << a->id << ": Other clock " << cnt << " ..." << endl;
            a->top->othr_clk = 1;
            a->top->eval();
            (*simtime)++;
            a->top->othr_clk = 0;
            a->top->eval();
            (*simtime)++;
        } else {
            done = 1;
        }
        omp_unset_lock(a->lock);

        sleep(1);
    }

    omp_set_lock(a->lock);
    cout << "id " << a->id << ": Finished ..." << endl;
    omp_unset_lock(a->lock);
}

int main(int argc, char** argv) {
    Verilated::commandArgs(argc, argv);
    Vdut* top = new Vdut;
    int cnt;
    int simtime = 0;
    // omp_lock_t lock_p;
    omp_init_lock(&lock_p);

    cout << "Simulation started ..." << endl;

    #pragma omp parallel num_threads(2)
    {
        int id = omp_get_thread_num();
        struct th_arg targs;
        targs.id = id;
        targs.lock = &lock_p;
        targs.top = top;
        targs.simtime = &simtime;
       
        if (id == 0) {
            sys_clk(&targs);
        } else {
            othr_clk(&targs);
        }
    }

    cout << "simtime=" << simtime << endl;
    // cout << "sys_cnt=" << top->dut__DOT__sys_cnt << endl;
    // cout << "othr_cnt=" << top->dut__DOT__othr_cnt << endl;
    delete top;
    return 0;
}