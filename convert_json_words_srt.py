import json
import argparse
import re

def replace_dot_with_comma(time_str):
  time_str = time_str.replace('.', ',')
  return time_str

def _json_to_srt(json_data):
  srt_data = []
  segments = sorted(json_data["segments"], key=lambda x: x["start"])
  count=0
  for i, segment in enumerate(segments):
    words = [word for word in segment["words"] if "start" in word and "end" in word]
    for j, word_segment in enumerate(words):
      duration = word_segment["end"] - word_segment["start"]
      if duration <= 0.042: # skip too short words, for a 24 fps video, you need at least 1/24 = 41.6666667ms of subtitle.
        continue
      duration_time = format_time(duration)
      start_time = format_time(word_segment["start"])
      end_time = format_time(word_segment["end"])
      word = word_segment["word"]
      word = word.strip()
      count = count + 1
      converted_time_str = replace_dot_with_comma(f"{count}\n{start_time} --> {end_time}\n{word}\n\n")
      srt_data.append(converted_time_str)
  return "".join(srt_data)

def format_time(seconds):
  hours = int(seconds // 3600)
  minutes = int((seconds % 3600) // 60)
  seconds = round(seconds % 60, 3)
  return f"{hours:02d}:{minutes:02d}:{seconds:06.3f}"

def json_to_srt(json_file):
  with open(json_file, 'r') as f:
    data = json.load(f)
  srt_data = _json_to_srt(data)
  return srt_data

def main():
  parser = argparse.ArgumentParser()
  parser.add_argument("-i", "--input", help="Input JSON file")
  parser.add_argument("-o", "--output", help="Output SRT file")
  args = parser.parse_args()
  srt_output = json_to_srt(args.input)

  with open(args.output, 'w') as f:
    f.write(srt_output)

if __name__ == '__main__':
  main()

