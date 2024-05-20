import json
import argparse

def _json_to_srt(json_data):
  srt_data = []
  segments = sorted(json_data["segments"], key=lambda x: x["start"])
  merged_segments = [segments[0]]
  
  for segment in segments[1:]:
    last_segment = merged_segments[-1]
    if segment["start"] == last_segment["start"] or segment["end"] == last_segment["end"]:
      last_segment["text"] += " " + segment["text"]
    else:
      merged_segments.append(segment)
  
  for i, segment in enumerate(merged_segments):
    start_time = format_time(segment["start"])
    end_time = format_time(segment["end"])
    text = segment["text"]
    text = text.strip()
    srt_data.append(f"{i+1}\n{start_time} --> {end_time}\n{text}\n\n")
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

