#!/bin/bash

# NOTE:
# curl https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.sh -o Miniconda3-latest-MacOSX-arm64.sh
# chmod +x Miniconda3-latest-MacOSX-arm64.sh
# bash Miniconda3-latest-MacOSX-arm64.sh
# conda create --name whisperx python=3.10
# conda activate whisperx
# conda install pytorch==2.0.0 torchvision==0.15.0 torchaudio==2.0.0 -c pytorch
# pip install git+https://github.com/m-bain/whisperx.git

whisperx $1 --compute_type float32 --output_format json --language en --print_progress True 

# usage: whisperx [-h] [--model MODEL] [--model_dir MODEL_DIR] [--device DEVICE] [--device_index DEVICE_INDEX]
#                 [--batch_size BATCH_SIZE] [--compute_type {float16,float32,int8}] [--output_dir OUTPUT_DIR]
#                 [--output_format {all,srt,vtt,txt,tsv,json,aud}] [--verbose VERBOSE]
#                 [--task {transcribe,translate}]
#                 [--language {af,am,ar,as,az,ba,be,bg,bn,bo,br,bs,ca,cs,cy,da,de,el,en,es,et,eu,fa,fi,fo,fr,gl,gu,ha,haw,he,hi,hr,ht,hu,hy,id,is,it,ja,jw,ka,kk,km,kn,ko,la,lb,ln,lo,lt,lv,mg,mi,mk,ml,mn,mr,ms,mt,my,ne,nl,nn,no,oc,pa,pl,ps,pt,ro,ru,sa,sd,si,sk,sl,sn,so,sq,sr,su,sv,sw,ta,te,tg,th,tk,tl,tr,tt,uk,ur,uz,vi,yi,yo,yue,zh,Afrikaans,Albanian,Amharic,Arabic,Armenian,Assamese,Azerbaijani,Bashkir,Basque,Belarusian,Bengali,Bosnian,Breton,Bulgarian,Burmese,Cantonese,Castilian,Catalan,Chinese,Croatian,Czech,Danish,Dutch,English,Estonian,Faroese,Finnish,Flemish,French,Galician,Georgian,German,Greek,Gujarati,Haitian,Haitian Creole,Hausa,Hawaiian,Hebrew,Hindi,Hungarian,Icelandic,Indonesian,Italian,Japanese,Javanese,Kannada,Kazakh,Khmer,Korean,Lao,Latin,Latvian,Letzeburgesch,Lingala,Lithuanian,Luxembourgish,Macedonian,Malagasy,Malay,Malayalam,Maltese,Maori,Marathi,Moldavian,Moldovan,Mongolian,Myanmar,Nepali,Norwegian,Nynorsk,Occitan,Panjabi,Pashto,Persian,Polish,Portuguese,Punjabi,Pushto,Romanian,Russian,Sanskrit,Serbian,Shona,Sindhi,Sinhala,Sinhalese,Slovak,Slovenian,Somali,Spanish,Sundanese,Swahili,Swedish,Tagalog,Tajik,Tamil,Tatar,Telugu,Thai,Tibetan,Turkish,Turkmen,Ukrainian,Urdu,Uzbek,Valencian,Vietnamese,Welsh,Yiddish,Yoruba}]
#                 [--align_model ALIGN_MODEL] [--interpolate_method {nearest,linear,ignore}] [--no_align]
#                 [--return_char_alignments] [--vad_onset VAD_ONSET] [--vad_offset VAD_OFFSET]
#                 [--chunk_size CHUNK_SIZE] [--diarize] [--min_speakers MIN_SPEAKERS] [--max_speakers MAX_SPEAKERS]
#                 [--temperature TEMPERATURE] [--best_of BEST_OF] [--beam_size BEAM_SIZE] [--patience PATIENCE]
#                 [--length_penalty LENGTH_PENALTY] [--suppress_tokens SUPPRESS_TOKENS] [--suppress_numerals]
#                 [--initial_prompt INITIAL_PROMPT] [--condition_on_previous_text CONDITION_ON_PREVIOUS_TEXT]
#                 [--fp16 FP16] [--temperature_increment_on_fallback TEMPERATURE_INCREMENT_ON_FALLBACK]
#                 [--compression_ratio_threshold COMPRESSION_RATIO_THRESHOLD]
#                 [--logprob_threshold LOGPROB_THRESHOLD] [--no_speech_threshold NO_SPEECH_THRESHOLD]
#                 [--max_line_width MAX_LINE_WIDTH] [--max_line_count MAX_LINE_COUNT]
#                 [--highlight_words HIGHLIGHT_WORDS] [--segment_resolution {sentence,chunk}] [--threads THREADS]
#                 [--hf_token HF_TOKEN] [--print_progress PRINT_PROGRESS]
#                 audio [audio ...]

