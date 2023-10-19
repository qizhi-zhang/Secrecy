cd ../build/
cmake ..
make test_codegen_qx test_codegen_qx1 test_codegen_qx4m

for row_num in 128 # 1024 # 1048576 1073741824
do
    for K in 10 100
    do
        echo "==============================================================="
        echo "--------------start test_codegen_qx1--------------------"
        echo "row_num="$row_num, "K="$K
        ifconfig | grep "lo"
        date
        # mpirun -np 3 -N 1  --hostfile ../vs_fedquery/hostfile ./test_codegen_qx1  $row_num $row_num $K
        mpirun -np 3  ./test_codegen_qx1  $row_num $row_num $K
        ifconfig | grep "TX"
        date
        echo "--------------end test_codegen_qx1--------------------"
        echo "==============================================================="
        echo "--------------start test_codegen_qx1--------------------"
        echo "row_num="$row_num, "K="$K
        ifconfig | grep "lo"
        date
        # mpirun -np 3 -N 1  --hostfile ../vs_fedquery/hostfile ./test_codegen_qx4m  $row_num $row_num $K
        mpirun -np 3  ./test_codegen_qx4m  $row_num $row_num $K
        ifconfig | grep "TX"
        date
        echo "--------------end--------------------"
        echo "==============================================================="
    done
done