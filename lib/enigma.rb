require_relative 'cipher'
require 'date'

class Enigma
  include Cipher

  def encrypt(text,
              key_num = Key.random_key,
              date = Offset.current_date)
    @hash = { encryption: '',
              key: key_num,
              date: date }
    cipher(text.downcase, @hash)
  end

  def decrypt(text, key_num, date = Offset.current_date)
    @hash = { decryption: '',
              key: key_num,
              date: date }
    cipher(text, @hash)
  end
end
