#!/bin/bash

NODE=$1

#cd /home/dzhao/persistent/gpfs_tmp/

######################
##### metadata #######
######################
#start=`date +%s`
#for i in {1..500}  
#do
#	touch /home/dzhao/persistent/gpfs_tmp/$NODE'N'$i
#done
#end=`date +%s`

########################
#### IO Throughput #####
########################
start=`date +%s`
#startr=`/home/dzhao/fusionFS-github/bgp_script/date`
for i in {1..10}
do
	dd if=/dev/zero of=/home/dzhao/persistent/gpfs_tmp/f64m$i bs=1024k count=64
done
#endr=`/home/dzhao/fusionFS-github/bgp_script/date`
end=`date +%s`

diff=$(( $end - $start ))
#diffr=$(echo $startr $endr | awk '{printf("%.2f", $2-$1)}')

echo "GPFS-WRITE $NODE $start $end $diff" >> /intrepid-fs0/users/dzhao/persistent/result_gpfs
