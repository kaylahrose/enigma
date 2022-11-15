require_relative 'enigma'

enigma = Enigma.new
encrypt = File.open(ARGV[1], 'w')
encryption = enigma.encrypt(File.read(ARGV[0]))
encrypt.write(encryption[:encryption])

puts "Created '#{ARGV[1]}' with the key #{encryption[:key]} and date #{encryption[:date]}"