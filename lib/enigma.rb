require_relative 'key'

class Enigma
  # attr_reader :keys

  def encrypt(msg, key_num, date)
    @e = { encryption: '',
          key: key_num,
          date: date }
    key = Key.new(key_num)
    offset = Offset.new(date)
    shift = Shift.new(key, offset)
    new_char(msg, shift)
    @e
  end

  def new_char(msg, shift)
    msg.each_char.with_index do |char, index|
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
end
