#!/usr/bin/env ruby
require 'fileutils'
include FileUtils
base_path = './*'
all_files = Dir[base_path].select {|f| File.directory? f }
all_files.each do |file|
  filepath = file
  file[0...2] = ''
  puts file
  parts = file.split(" - ")
  if parts.length != 2 
    puts "skipping #{filepath}"
  else
    artist = parts[0].strip
    album_year = parts[1].strip
    year_arr = parts[1].split("(")
    album = year_arr[0].strip
    yearch = year_arr[1]
    year = yearch.chomp(")")
    mkdir_p("./#{artist}/#{year} - #{album}")
    new_dir =  "./#{artist}/#{year} - #{album}"
    puts "./#{artist}/#{year} - #{album}"
    puts "Copying..."
    FileUtils.cp_r("#{filepath}/.", new_dir)
  end
end
puts "End"

