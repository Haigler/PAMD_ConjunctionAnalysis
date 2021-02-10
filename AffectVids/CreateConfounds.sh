#!/bin/bash

cd /home/katie/prototyping/emotion-reappraisal-IAPS/Data/affectvids/derivatives/fmriprep/
#Create subject list
if [ ! -f subjList.txt ]; then
	ls | grep ^sub- > subjList.txt
fi

#Create timing files by extracting trans_x, trans_y, trans_z, rot_x, rot_y, rot_z

for subj in `cat subjList.txt`; do
	cd $subj/func
	cat ${subj}_task-view_run-1_desc-confounds_timeseries.tsv | awk 'NR==1 {for (i=1; i<=NF; i++) {f[$i] = i } } {print $(f["trans_x"]), $(f["trans_y"]), $(f["trans_z"]), $(f["rot_x"]), $(f["rot_y"]),$(f["rot_z"])}' > ${subj}_task-view_run-1_desc-confounds_timeseries.txt
	cat ${subj}_task-view_run-2_desc-confounds_timeseries.tsv | awk 'NR==1 {for (i=1; i<=NF; i++) {f[$i] = i } } {print $(f["trans_x"]), $(f["trans_y"]), $(f["trans_z"]), $(f["rot_x"]), $(f["rot_y"]),$(f["rot_z"])}' > ${subj}_task-view_run-2_desc-confounds_timeseries.txt
	sed '1d' ${subj}_task-view_run-1_desc-confounds_timeseries.txt > ${subj}_task-view_run-1_desc-confounds_timeseries_nohead.txt
	sed '1d' ${subj}_task-view_run-2_desc-confounds_timeseries.txt > ${subj}_task-view_run-2_desc-confounds_timeseries_nohead.txt
	cd ../..
done
