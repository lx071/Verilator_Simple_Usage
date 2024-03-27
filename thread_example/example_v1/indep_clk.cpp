// https://gist.github.com/brabect1/9f8d7d144367b9f3dd77ba2a3b459f1d
// general includes
#include <iostream>
#include <pthread.h>
#include <string> 
#include <unistd.h>

// Verilator related includes
#include "Vdut.h"
#include <verilated.h>
#if VM_TRACE
#include <verilated_vcd_c.h>
#endif

using namespace std;

struct th_arg {
    int id;
    pthread_mutex_t* mutex;
    Vdut* top;
    int* simtime;
};

static pthread_mutex_t mutex_p;


void* sys_clk(void* arg) {
    struct th_arg* a = (th_arg*)arg;
    int done = 0;
    int* simtime = a->simtime;
    int cnt = 0;

    pthread_mutex_lock(a->mutex);
    cout << "id " << a->id << ": System clock started ..." << endl;
    pthread_mutex_unlock(a->mutex);

    while (!done) {
        cnt++;
        pthread_mutex_lock(a->mutex);
        if (!Verilated::gotFinish()) {
            a->top->sys_clk = 1;
            a->top->eval();
            (*simtime)++;
            a->top->sys_clk = 0;
            a->top->eval();
            (*simtime)++;
        } else {
            done = 1;
        }
        pthread_mutex_unlock(a->mutex);

        usleep(10);
    }

    pthread_mutex_lock(a->mutex);
    cout << "id " << a->id << ": Finished ..." << endl;
    pthread_mutex_unlock(a->mutex);

    pthread_exit(NULL);
}


void* othr_clk(void* arg) {
    struct th_arg* a = (th_arg*)arg;
    int done = 0;
    int* simtime = a->simtime;
    int cnt = 0;

    pthread_mutex_lock(a->mutex);
    cout << "id " << a->id << ": Other clock started ..." << endl;
    pthread_mutex_unlock(a->mutex);

    while (!done) {
        cnt++;
        pthread_mutex_lock(a->mutex);
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
        pthread_mutex_unlock(a->mutex);

        // unlike in the system clock thread, we stop the other
        // clock generator for a while
        sleep(1);
    }

    pthread_mutex_lock(a->mutex);
    cout << "id " << a->id << ": Finished ..." << endl;
    pthread_mutex_unlock(a->mutex);

    pthread_exit(NULL);
}


int main(int argc, char **argv, char **env) {
    Verilated::commandArgs(argc, argv);
    Vdut* top = new Vdut;
    int cnt;
    int simtime = 0;
    pthread_t threads[2];
    struct th_arg targs[2];

    pthread_mutex_lock(&mutex_p);
    cout << "Simulation started ..." << endl;
    pthread_mutex_unlock(&mutex_p);

    for (long int i = 0 ; i < 2 ; ++i) {
        targs[i].id = i;
        targs[i].mutex = &mutex_p;
        targs[i].top = top;
        targs[i].simtime = &simtime;
        int t;
       
        if (i == 0) {
           t = pthread_create(&threads[i], NULL, sys_clk, (void*)&targs[i]);
        } else {
           t = pthread_create(&threads[i], NULL, othr_clk, (void*)&targs[i]);
        }
 
        if (t != 0) {
            pthread_mutex_lock(&mutex_p);
            cout << "Error in thread creation: " << t << endl;
            pthread_mutex_unlock(&mutex_p);
        }
    }
 
    for(int i = 0 ; i < 2; ++i) {
        void* status;
        int t = pthread_join(threads[i], &status);
        if (t != 0) {
            pthread_mutex_lock(&mutex_p);
            cout << "Error in thread join: " << t << endl;
            pthread_mutex_unlock(&mutex_p);
        }
    }
 
    pthread_mutex_lock(&mutex_p);
    cout << "simtime=" << simtime << endl;
    // cout << "sys_cnt=" << top->dut__DOT__sys_cnt << endl;
    // cout << "othr_cnt=" << top->dut__DOT__othr_cnt << endl;
    pthread_mutex_unlock(&mutex_p);
  
    delete top;
    return 0;
}