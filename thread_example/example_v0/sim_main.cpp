// Include common routines
#include <verilated.h>

// Include model header, generated from Verilating "top.v"
#include "Vtop.h"

#include <pthread.h>
#include <unistd.h>
#define NUM_THREADS 2

#include <omp.h>
#include <iostream>

using namespace std;

// 线程的运行函数
void* say_A(void* args)
{
    cout << "Hello A！" << endl;
    sleep(1);
    cout << "Hello A end！" << endl;
    pthread_exit(NULL);
}

// 线程的运行函数
void* say_B(void* args)
{
    cout << "Hello B！" << endl;
    cout << "Hello B end！" << endl;
    pthread_exit(NULL);
}


// OpenMp for
// #pragma omp parallel for 告诉编译器接下来的for循环要并行执行

void Func()
{
    int length = 5;

#pragma omp parallel for num_threads(3)
    for (int i = 0; i < length; i++)
        std::cout << i << ": " << omp_get_thread_num() << std::endl;
}


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
    Vtop* const top = new Vtop{contextp};

    // 定义线程的 id 变量，多个变量使用数组
    pthread_t tids[NUM_THREADS];
    int ret1 = pthread_create(&tids[0], NULL, say_A, NULL);
    int ret2 = pthread_create(&tids[1], NULL, say_B, NULL);
    if (ret1 != 0 || ret2 != 0)
    {
       cout << "pthread_create error: error_code=" << ret1 <<" "<< ret2 << endl;
    }

    for(int i = 0 ; i < 2; ++i) {
        void* status;
        int t = pthread_join(tids[i], &status);
    }

    Func();
    
    // Simulate until $finish
    while (!contextp->gotFinish()) {

        // Evaluate model
        top->eval();
    }

    // Final model cleanup
    top->final();

    // Destroy model
    delete top;

    // Return good completion status
    return 0;
}