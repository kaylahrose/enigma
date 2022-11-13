require_relative 'enigma'

enigma = Enigma.new
encryption = File.read(ARGV[0])
encryption.delete! '\":}{,'
encryption = Hash[encryption.split.map { |pair| pair.split('=>') }]
encryption.transform_keys!(&:to_sym)

decryption = enigma.decrypt(encryption[:encryption], encryption[:key], encryption[:date])
file = File.open(ARGV[1], 'w')
file.write(decryption)

puts "Created '#{ARGV[1]}' with the key #{decryption[:key]} and date #{decryption[:date]}"
