#!/usr/bin/bash
 
/usr/bin/time -f "00-->%e %U %S" sort one_million.csv > /dev/null
#/usr/bin/time -f "01-->%e %U %S" sort --parallel=01 one_million.csv > /dev/null
#/usr/bin/time -f "02-->%e %U %S" sort --parallel=02 one_million.csv > /dev/null
#/usr/bin/time -f "03-->%e %U %S" sort --parallel=03 one_million.csv > /dev/null
#/usr/bin/time -f "04-->%e %U %S" sort --parallel=04 one_million.csv > /dev/null
#/usr/bin/time -f "05-->%e %U %S" sort --parallel=05 one_million.csv > /dev/null
#/usr/bin/time -f "06-->%e %U %S" sort --parallel=06 one_million.csv > /dev/null
#/usr/bin/time -f "07-->%e %U %S" sort --parallel=07 one_million.csv > /dev/null
#/usr/bin/time -f "08-->%e %U %S" sort --parallel=08 one_million.csv > /dev/null
#/usr/bin/time -f "09-->%e %U %S" sort --parallel=09 one_million.csv > /dev/null
/usr/bin/time -f "10-->%e %U %S" sort --parallel=10 one_million.csv > /dev/null
/usr/bin/time -f "20-->%e %U %S" sort --parallel=20 one_million.csv > /dev/null
/usr/bin/time -f "30-->%e %U %S" sort --parallel=30 one_million.csv > /dev/null
/usr/bin/time -f "40-->%e %U %S" sort --parallel=40 one_million.csv > /dev/null
/usr/bin/time -f "50-->%e %U %S" sort --parallel=50 one_million.csv > /dev/null
 
