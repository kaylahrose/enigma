require_relative 'enigma'

enigma = Enigma.new
encryption = File.read(ARGV[0])
decryption = enigma.decrypt(encryption, ARGV[2], ARGV[3])
file = File.open(ARGV[1], 'w')
file.write(decryption[:decryption])

puts "Created '#{ARGV[1]}' with the key #{decryption[:key]} and date #{decryption[:date]}"
