#!/bin/bash

python convert_json_srt.py.py -i $1 -o $1.srt
python convert_json_words_srt.py -i $1 -o $1_words.srt
