require_relative 'enigma'

enigma = Enigma.new
modified = enigma.encrypt(File.read(ARGV[0]))
enigma.results(modified)
