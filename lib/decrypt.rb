require_relative 'enigma'

enigma = Enigma.new
modified = enigma.decrypt(File.read(ARGV[0]), ARGV[2], ARGV[3])
enigma.results(modified)
