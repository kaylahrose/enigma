require_relative 'enigma'

enigma = Enigma.new
modified = enigma.crack(File.read(ARGV[0]), ARGV[2])
enigma.results(modified)
