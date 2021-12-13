#!/usr/bin/ruby
require 'active_encode'
ActiveEncode::Base.engine_adapter = :ffmpeg
extensions =  ["mkv" "mp4"]
dir = "media/"
# fileName = "arvo_pinwheels_20210412_171417.mp4"
# fileName = "arvo_pinwheels_20210412_171417_truncated.mp4"
# fileName = "arvo_pinwheels_20210412_171417_tail_c_plus_4000000.mp4"
# fileName = "slice_mismatch_error.mkv"

files = Dir.glob("#{dir}*.{mp4,mkv}")
files.each do |fileName|
  puts "Filename: #{fileName}"
  path = fileName
  file = "file://#{File.absolute_path path}"
  puts "URI path: #{file}"
  encode_obj = ActiveEncode::Base.create(file, { outputs: [{ label: "low", ffmpeg_opt: "-s 640x480", extension: "mp4"}, { label: "high", ffmpeg_opt: "-s 1280x720", extension: "mp4"}] })
  success = encode_obj.exit_status == 0
  #encode_obj.reload
  has_errors = encode_obj.output.length > 0
  puts "Has Errors? #{has_errors}"
  puts "success!!!!! #{success}"
  puts "encode obj!!!"
  pp encode_obj

end
