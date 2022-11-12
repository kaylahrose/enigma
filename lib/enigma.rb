require_relative 'key'

class Enigma
  # attr_reader :keys

  def encrypt(msg, key, date)
    @shift = shift.new(key, date)
    # @keys = Keys.new(key)
    msg.each_char do |char|
      # require 'pry'; binding.pry
      assoc_shift(msg.index(char), key)
    end
  end

  def characters
    ('a'..'z').to_a << ' '
  end

  def assoc_shift(index, shift)
    # key = Key.new(key)
    # loop index - 4 until 0..3
    # require 'pry'; binding.pry
    index -= 4 while index > 3
    if index == 0
      shift.a_shift
    elsif index == 1
      shift.b_shift
    elsif index == 2
      shift.c_shift
    else
      index == 3
      shift.d_shift
    end
  end
end
