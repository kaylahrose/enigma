require_relative 'key'
require_relative 'offset'
require_relative 'shift'
require_relative 'cipher'
require 'default'
require 'date'

class Enigma
  include Cipher
  include Default

  def encrypt(msg, key_num = random_key, date = current_date)
    @hash = { encryption: '',
              key: key_num,
              date: date }
    cipher(msg.downcase)
  end

  # def assoc_shift(index, shift)
  #   index -= 4 while index > 3
  #   if index == 0
  #     shift.a_shift
  #   elsif index == 1
  #     shift.b_shift
  #   elsif index == 2
  #     shift.c_shift
  #   else
  #     shift.d_shift
  #   end
  # end

  def decrypt(msg, key_num, date = current_date)
    @hash = { decryption: '',
              key: key_num,
              date: date }
    cipher(msg)
  end
end
