#!/bin/bash

NODE=$1

#cd /home/dzhao/persistent/gpfs_tmp/

######################
##### metadata #######
######################
#start=`date +%s`
#for i in {1..10000}  
#do
#	touch $NODE'_'$i
#done
#end=`date +%s`

########################
#### IO Throughput #####
########################
start=`date +%s`
startr=`/home/dzhao/fusionFS-github/bgp_script/date`
dd of=/dev/null if=/home/dzhao/persistent/f1m bs=1024k count=1
endr=`/home/dzhao/fusionFS-github/bgp_script/date`
end=`date +%s`

diff=$(( $end - $start ))
diffr=$(echo $startr $endr | awk '{printf("%.2f", $2-$1)}')

echo "GPFS-READ $NODE $start $end $diff $diffr" >> /intrepid-fs0/users/dzhao/persistent/result_gpfs
