require_relative 'enigma'

enigma = Enigma.new
decrypt = File.open(ARGV[1], 'w')
decryption = enigma.decrypt(File.read(ARGV[0]))
encrypt.write(encryption)
# require 'pry'; binding.pry
puts "Created '#{ARGV[1]}'with the key #{encryption[:key]} and date #{encryption[:date]}"