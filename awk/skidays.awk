#!/bin/awk
# Usage : awk -f skidays.awk data.csv > report.out
# or   cat data.csv | awk -f skidays.awk
# 
#
BEGIN {	FS = ","
	print "\nSkidays Activity Report"
	print "\nDays.\tVertical\tLifts\tLift KM\tSlope Distance\n";
min1 =10000
min2 =10000
min3 =10000
min4 =10000
}
{	
	printf "%s\t%.0f\t\t%.0f\t%.0f\t%.0f\n" , NR, $1, $2, $3, $4;
	sum1+=$1; 
	sum2+=$2; 
	sum3+=$3;
	sum4+=$4;
	++n;
	
	min1 = (min1>$1)?$1:min1
	min2 = (min2>$2)?$2:min2
	min3 = (min3>$3)?$3:min3
	min4 = (min4>$4)?$4:min4
	
	max1=(max1>$1)?max1:$1
	max2=(max2>$2)?max2:$2
	max3=(max3>$3)?max3:$3
	max4=(max4>$4)?max4:$4
} 
END { 
	printf "\nTotals:\t%.0f\t\t%.0f\t%.0f\t%.0f\n", sum1, sum2, sum3, sum4 
	printf "\nAvg:\t%.0f\t\t%.0f\t%.0f\t%.0f\n", sum1/n, sum2/n, sum3/n, sum4/n 
	printf "Min:\t%.0f\t\t%.0f\t%.0f\t%.0f\n", min1, min2, min3,min4;
	printf "Max:\t%.0f\t\t%.0f\t%.0f\t%.0f\n\n", max1, max2, max3,max4;
}
