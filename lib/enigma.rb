require_relative 'cipher'
require_relative 'key'
require_relative 'offset'
require_relative 'shift'
require 'date'

class Enigma
  include Cipher

  def encrypt(text, key_num = Key.random_key, date = Offset.current_date)
    hash = { encryption: text.downcase.to_s,
             key: key_num,
             date: date }
    shift = Shift.new(Key.new(hash[:key]), Offset.new(hash[:date]))
    update_string(hash, shift)
  end

  def decrypt(text, key_num, date = Offset.current_date)
    hash = { decryption: text,
             key: key_num,
             date: date }
    shift = Shift.new(Key.new(hash[:key], false), Offset.new(hash[:date], false))
    update_string(hash, shift)
  end

  def crack(text, date = Offset.current_date)
    loop do
      current = decrypt(text, Key.random_key, date)
      if current[:decryption][-4..] == ' end'
        return current
        break
      end
    end
  end

  def results(modified)
    file = File.open(ARGV[1], 'w')
    file.write(modified[modified.keys[0]])
    puts "Created '#{ARGV[1]}' with the key #{modified[:key]} and date #{modified[:date]}"
  end
end
