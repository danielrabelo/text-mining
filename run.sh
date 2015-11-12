#!/bin/bash

export JAVA_HOME=/usr/
export MAHOUT_HEAPSIZE=14000

#echo "Merge files"
#mkdir 20news-all
#cp -R 20news-bydate*/*/* 20news-all

echo "Create sequential files"
/opt/apache-mahout-distribution-0.11.0/bin/mahout seqdirectory -i 20news-all -o 20news-seq -ow

echo "Features extraction (vectors)"
/opt/apache-mahout-distribution-0.11.0/bin/mahout seq2sparse -i 20news-seq -o 20news-vectors -lnorm -nv -wt tfidf

echo "Segmentation files (training and test)"
/opt/apache-mahout-distribution-0.11.0/bin/mahout split -i 20news-vectors/tfidf-vectors --trainingOutput 20news-train-vectors --testOutput 20news-test-vectors --randomSelectionPct 40 --overwrite --sequenceFiles -xm sequential

echo "Training..."
/opt/apache-mahout-distribution-0.11.0/bin/mahout trainnb -i 20news-train-vectors -o model -li labelindex -ow -c

echo "Test..."
/opt/apache-mahout-distribution-0.11.0/bin/mahout testnb -i 20news-test-vectors -m model -l labelindex -ow -o 20news-testing -c
