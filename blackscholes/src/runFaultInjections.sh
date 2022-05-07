#!/bin/bash
indices=(312 356 357 358 445 451 454 455 456 537 543 547 553 557 563 570 576 579 580 581 582 596 607 618 629 640) 
for i in ${indices[@]}
do
    python3 changeYaml.py $i &  
    wait
    echo "profiling index " + $i
    rm -r ./llfi
    echo "llfi removed"
    sleep 1
    instrument --readable blackscholes.ll &
    wait
    sleep 1
    profile ./llfi/blackscholes-profiling.exe 1 in_16.txt prices.txt &
    wait
    cd . &
    wait
done