require './lib/enigma'

from_file, to_file = ARGV
# require 'pry' ; binding.pry
@enigma = Enigma.new(from_file, to_file)
@enigma.enc_file_read
