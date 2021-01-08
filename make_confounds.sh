#!/bin/bash

#Create subject list
if [ ! -f subjList.txt ]; then
	ls | grep ^sub- > subjList.txt
fi

for subj in `cat subjList.txt`; do
	cd $subj/ses-01/func
	cat ${subj}_ses-01_task-infant_run-01_desc-confounds_timeseries.tsv | awk 'NR==1 {for (i=1; i<=NF; i++) {f[$i] = i } } {print $(f["trans_x"]), $(f["trans_y"]), $(f["trans_z"]), $(f["rot_x"]), $(f["rot_y"]),$(f["rot_z"])}' > ${subj}_ses-01_task-infant_run-01_desc-confounds_timeseries.txt
	cat ${subj}_ses-01_task-infant_run-02_desc-confounds_timeseries.tsv | awk 'NR==1 {for (i=1; i<=NF; i++) {f[$i] = i } } {print $(f["trans_x"]), $(f["trans_y"]), $(f["trans_z"]), $(f["rot_x"]), $(f["rot_y"]),$(f["rot_z"])}' > ${subj}_ses-01_task-infant_run-02_desc-confounds_timeseries.txt
	cat ${subj}_ses-01_task-affect_run-01_desc-confounds_timeseries.tsv | awk 'NR==1 {for (i=1; i<=NF; i++) {f[$i] = i } } {print $(f["trans_x"]), $(f["trans_y"]), $(f["trans_z"]), $(f["rot_x"]), $(f["rot_y"]),$(f["rot_z"])}' > ${subj}_ses-01_task-affect_run-01_desc-confounds_timeseries.txt
	cat ${subj}_ses-01_task-affect_run-02_desc-confounds_timeseries.tsv | awk 'NR==1 {for (i=1; i<=NF; i++) {f[$i] = i } } {print $(f["trans_x"]), $(f["trans_y"]), $(f["trans_z"]), $(f["rot_x"]), $(f["rot_y"]),$(f["rot_z"])}' > ${subj}_ses-01_task-affect_run-02_desc-confounds_timeseries.txt
	sed '1d' ${subj}_ses-01_task-infant_run-01_desc-confounds_timeseries.txt > ${subj}_ses-01_task-infant_run-01_desc-confounds_timeseries_nohead.txt
	sed '1d' ${subj}_ses-01_task-infant_run-02_desc-confounds_timeseries.txt > ${subj}_ses-01_task-infant_run-02_desc-confounds_timeseries_nohead.txt
	sed '1d' ${subj}_ses-01_task-affect_run-01_desc-confounds_timeseries.txt> ${subj}_ses-01_task-affect_run-01_desc-confounds_timeseries_nohead.txt
	sed '1d' ${subj}_ses-01_task-affect_run-02_desc-confounds_timeseries.txt> ${subj}_ses-01_task-affect_run-02_desc-confounds_timeseries_nohead.txt
	cd ../../..
done
