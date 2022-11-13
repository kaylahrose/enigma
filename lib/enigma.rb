require_relative 'key'
require_relative 'offset'
require_relative 'shift'
require 'date'

class Enigma

  def encrypt(msg, key_num = random_key, date = (Date.today).strftime('%d%m%y'))
    @e = { encryption: '',
           key: key_num,
           date: date }
    key = Key.new(key_num)
    offset = Offset.new(date)
    shift = Shift.new(key, offset)
    new_char(msg, shift)
    @e
  end

  def random_key
    n = rand(0..99999).to_s
    while n.length < 5
      n.insert(0, '0')
    end
    n
  end

  def new_char(msg, shift)
    msg.each_char.with_index do |char, index|
      require 'pry'; binding.pry
      new_index = characters.index(char) + assoc_shift(index, shift)
      new_index -= 27 while new_index > 26
      @e[:encryption] << characters[new_index]
    end
  end

  def characters
    ('a'..'z').to_a << ' '
  end

  def assoc_shift(index, shift)
    index -= 4 while index > 3
    if index == 0
      shift.a_shift
    elsif index == 1
      shift.b_shift
    elsif index == 2
      shift.c_shift
    else
      shift.d_shift
    end
  end

  def decrypt(msg, key_num, date = (Date.today).strftime('%d%m%y'))
    # TODO refactor 
    @d = { decryption: '',
           key: key_num,
           date: date }
           key = Key.new(key_num)
    offset = Offset.new(date)
    shift = Shift.new(key, offset)
    dnew_char(msg, shift)
    @d
  end

  def dnew_char(msg, shift)
    msg.each_char.with_index do |char, index|
      new_index = characters.index(char) - assoc_shift(index, shift)
      new_index += 27 while new_index < 0
      @d[:decryption] << characters[new_index]
    end
  end
end
