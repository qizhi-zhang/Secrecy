cd build
make test_codegen_q2
mpirun -np 3 ./test_codegen_q2.out 1024 1024