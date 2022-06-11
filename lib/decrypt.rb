require './lib/enigma'

from_file, to_file, key, date = ARGV
@enigma = Enigma.new(from_file, to_file)
@enigma.dec_file_read(key, date)
