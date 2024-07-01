# USAGE example
#sh run_fMRIprep.sh run_fMRIprep_sbatch.slurm

###############################################################
export STUDY=/work/swglab/data/R61rtsz/analysis/proj_franci_selfref
which_sbatch=$1

# generates a job array containing n jobs. n is determined by counting up every first field of each line in participants.tsv and subtracting 1 (to account for header)
sbatch --array=1-$(( $( wc -l $STUDY/rawdata/participants.tsv | cut -f1 -d' ' ) - 1 )) ${which_sbatch} ${STUDY}