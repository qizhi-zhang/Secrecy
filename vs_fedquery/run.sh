echo "--------------start--------------------"
ifconfig | grep "lo"
date
cd ../build/
# mpirun -np 3 -N 1  --hostfile ../vs_fedquery/hostfile ./test_codegen_qx  1024 1024 10
mpirun -np 3  ./test_codegen_qx  128 128 10
ifconfig | grep "TX"
date
echo "--------------end--------------------"
