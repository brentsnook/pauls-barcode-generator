#!/usr/bin/env ruby

require 'bundler'
Bundler.setup
require 'barby'
require 'barby/barcode/code_128'
require 'barby/outputter/png_outputter'

output_dir = File.join(File.dirname(__FILE__), 'barcodes')

ARGV.each do |datum|
  barcode = Barby::Code128B.new(datum)
  file = File.join(output_dir, "#{datum}.png")
  File.open(file, 'wb'){|f| f.write barcode.to_png }
  puts "Wrote barcode to #{file}"
end

