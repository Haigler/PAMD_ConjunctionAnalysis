#!/bin/bash

#Create subject list
if [ ! -f subjList.txt ]; then
	ls | grep ^sub- > subjList.txt
fi

for subj in `cat subjList.txt`; do
	cd $subj/ses-01/func
	cat ${subj}_ses-01_task-affect_run-01_events.tsv | awk '{if ($5=="EmoLookNeg") {print $1, $2, 1}}' > ${subj}_ses-01_task-affect_run-01_EmoLookNeg.txt
	cat ${subj}_ses-01_task-affect_run-01_events.tsv | awk '{if ($5=="EmoLookPos") {print $1, $2, 1}}' > ${subj}_ses-01_task-affect_run-01_EmoLookPos.txt
	cat ${subj}_ses-01_task-affect_run-01_events.tsv | awk '{if ($5=="EmoLabelNeg") {print $1, $2, 1}}' > ${subj}_ses-01_task-affect_run-01_EmoLabelNeg.txt
	cat ${subj}_ses-01_task-affect_run-01_events.tsv | awk '{if ($5=="EmoLabelPos") {print $1, $2, 1}}' > ${subj}_ses-01_task-affect_run-01_EmoLabelPos.txt
	cat ${subj}_ses-01_task-affect_run-02_events.tsv | awk '{if ($5=="EmoLookNeg") {print $1, $2, 1}}' > ${subj}_ses-01_task-affect_run-02_EmoLookNeg.txt
	cat ${subj}_ses-01_task-affect_run-02_events.tsv | awk '{if ($5=="EmoLookPos") {print $1, $2, 1}}' > ${subj}_ses-01_task-affect_run-02_EmoLookPos.txt
	cat ${subj}_ses-01_task-affect_run-02_events.tsv | awk '{if ($5=="EmoLabelNeg") {print $1, $2, 1}}' > ${subj}_ses-01_task-affect_run-02_EmoLabelNeg.txt
	cat ${subj}_ses-01_task-affect_run-02_events.tsv | awk '{if ($5=="EmoLabelPos") {print $1, $2, 1}}' > ${subj}_ses-01_task-affect_run-02_EmoLabelPos.txt
	cat ${subj}_ses-01_task-infant_run-01_events.tsv | awk '{if ($5=="InfOwnNeg") {print $1, $2, 1}}' > ${subj}_ses-01_task-infant_run-01_InfOwnNeg.txt
	cat ${subj}_ses-01_task-infant_run-01_events.tsv | awk '{if ($5=="InfOwnPos") {print $1, $2, 1}}' > ${subj}_ses-01_task-infant_run-01_InfOwnPos.txt
	cat ${subj}_ses-01_task-infant_run-01_events.tsv | awk '{if ($5=="InfOtherNeg") {print $1, $2, 1}}' > ${subj}_ses-01_task-infant_run-01_InfOtherNeg.txt
	cat ${subj}_ses-01_task-infant_run-01_events.tsv | awk '{if ($5=="InfOtherPos") {print $1, $2, 1}}' > ${subj}_ses-01_task-infant_run-01_InfOtherPos.txt
	cat ${subj}_ses-01_task-infant_run-02_events.tsv | awk '{if ($5=="InfOwnNeg") {print $1, $2, 1}}' > ${subj}_ses-01_task-infant_run-02_InfOwnNeg.txt
	cat ${subj}_ses-01_task-infant_run-02_events.tsv | awk '{if ($5=="InfOwnPos") {print $1, $2, 1}}' > ${subj}_ses-01_task-infant_run-02_InfOwnPos.txt
	cat ${subj}_ses-01_task-infant_run-02_events.tsv | awk '{if ($5=="InfOtherNeg") {print $1, $2, 1}}' > ${subj}_ses-01_task-infant_run-02_InfOtherNeg.txt
	cat ${subj}_ses-01_task-infant_run-02_events.tsv | awk '{if ($5=="InfOtherPos") {print $1, $2, 1}}' > ${subj}_ses-01_task-infant_run-02_InfOtherPos.txt

	cd ../../..
done
