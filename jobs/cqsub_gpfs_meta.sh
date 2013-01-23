rm ~/persistent/result_gpfs
#rm -rf ~/persistent/gpfs_tmp
mkdir -p ~/persistent/gpfs_tmp
cqsub -p FusionFS -k zepto-vn-eval -n 256 -t 15 gpfs_meta.sh
