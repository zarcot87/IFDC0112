#!/usr/bin/bash
#LINES=$(wc -l Electric_Vehicle_Population_Data.csv | awk '{print $1}');DISTINCT=$(cut -d\; -f1 Electric_Vehicle_Population_Data.csv | uniq | wc -l  );PERCENT=$(bc <<< ""scale=2; $DISTINCT / $LINES * 100""); echo "$(head -1 Electric_Vehicle_Population_Data.csv | cut -d\; -f1) tiene $DISTINCT valores distintos de un total de $LINES registros.Esto representa $PERCENT%" 
