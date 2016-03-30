#!/bin/bash

echo "Create sequential files"
/opt/apache-mahout-distribution-0.11.0/bin/mahout seqdirectory -i files -o files-seq -ow

echo "Features extraction (vectors)"
/opt/apache-mahout-distribution-0.11.0/bin/mahout seq2sparse -i files-seq -o files-vectors -lnorm -nv -wt tfidf

echo "Segmentation files (training and test)"
/opt/apache-mahout-distribution-0.11.0/bin/mahout split -i files-vectors/tfidf-vectors --trainingOutput files-train-vectors --testOutput files-test-vectors --randomSelectionPct 30 --overwrite --sequenceFiles -xm sequential

echo "Training..."
/opt/apache-mahout-distribution-0.11.0/bin/mahout trainnb -i files-train-vectors -o model -li labelindex -ow -c

echo "Test..."
/opt/apache-mahout-distribution-0.11.0/bin/mahout testnb -i files-test-vectors -m model -l labelindex -ow -o files-testing -c
