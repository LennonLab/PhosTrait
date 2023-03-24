#!/bin/bash
##---->RUN THIS SCRIPT FROM THE FOLDER THAT I HAVE ALL MY ALIGNMENTS SAVED FOR Gblocks
exec >> log.txt #This writes everything to a log file
DATE=$(date '+%d_%b_%Y'); #Date of analysis
mkdir -p $DATE; #All output files will be saved in a directory named by today's date
for FILE in *.fasta; do
	muscle -in $FILE -out $FILE"_aln.fa"
	/Applications/Gblocks_0.91b/Gblocks "$FILE"_aln.fa -t='p' -b1=0.5 -b2=0.55 -b3=8 -b4=5 -b5='h';
	echo $FILE;
done;
for FILE2 in *gb; do
	tr -d ' ' < $FILE2 > $FILE2.fasta;
done;