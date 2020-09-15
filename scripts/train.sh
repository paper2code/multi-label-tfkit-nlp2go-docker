#!/bin/sh

set -x
set -e

cd /opt/tfkit-pwc/scripts
pwd

python3 train.py

# 
nlprep --dataset clas_csv --infile /opt/tfkit-pwc/data/papers-with-abstracts.csv --outdir /opt/tfkit-pwc/data_pwa --util splitData

# 
tfkit-train --train ../data_pwa/papers-with-abstracts.csv_valid.csv --test ../data_pwa/papers-with-abstracts.csv_valid.csv --model clas --config albert-base-v2 --maxlen 300 --batch 10 --cache

# 
tfkit-eval --valid ../data_pwa/papers-with-abstracts.csv_valid.csv --model ../checkpoints/1.pt --metric clas

# 
tfkit-eval --valid ./data_pwa/papers-with-abstracts.csv_valid.csv --model ../checkpoints/1.pt --metric clas --print

# 
