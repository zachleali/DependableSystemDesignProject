#!/bin/bash
indices=(11 56 102 103 137 145 150 284 259 290 315 352 353 379 389 390 396 397 407 412 412 434 445 480 496 502 5007 508 525 577 578 584 585 595 610 611 612 624 634 635 636 641 642 643 651 662 663 664 665 671 672 673 729 766 767 773 774 806 839 847 852 853 854 859 864 865 866 892 908 918 919 920 925 926 927 951 966 967 968 973 974 975 984 999 1000 1001 1007 1008 1009 1014 1015 1016 1046 1097 1098 1099 1092 1023 1153 1154 1155 1160 1170 1171 1172 1177 1178 1179 1195 1236 1237 1238 1243 1253 1254 1255 1268 1278 1279 1280 1291 1301 1302 1303 1308 1309 1310 1322 1376 1378 1379 1392 1404 1405 1406 1407 1418 1429 1430 1431 1436 1446 1447 1448 1453 1454 1459 1460 1461 1481 1588 1589 1673 1681 1864 1869 1874 1879 1884 1889 1894 1899 2020 2021 2028 2035 2042 2054 2066 2072 2078 2084 2090 2100 2108 2118 2119 2120 2142 2170 2180 2181 2182 2192 2193 2194 2217 2240 2241 2259 2260 2333 2334 2335 2340 2341 2346 2347 2348 2375 2456 2457 2462 2463 2464 2480 2485 2486 2487 2500 2900 2901 2902 2918 2919 2922 2923 2937 2947 2975 2976 2961 2962 2986 2987 2988 3000 3009 3010 3011 3016 3017 3018 3037 3056 3065 3066 3067 3072 3073 3095 3123 3124 3130 3131 3132 3320 3224) 
for i in ${indices[@]}
do
    echo "profiling index " + $i
    rm -r ./llfi
    echo "llfi removed"
    sleep 1
    instrument --readable swaptions.ll &
    wait
    sleep 1
    profile ./llfi/swaptions-profiling.exe -ns 3 -sm 50 -nt 1 &
    wait
    cd .
    sleep 1
    python3 changeYaml.py $i &
    wait
done