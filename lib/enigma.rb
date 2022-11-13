require_relative 'cipher'
require_relative 'default'
require 'date'

class Enigma
  include Cipher
  include Default

  def encrypt(text, key_num = random_key, date = current_date)
    @hash = { encryption: '',
              key: key_num,
              date: date }
    cipher(text.downcase)
  end

  def decrypt(text, key_num, date = current_date)
    @hash = { decryption: '',
              key: key_num,
              date: date }
    cipher(text)
  end
end
