require_relative 'key'

class Enigma
    # attr_reader :keys

  def encrypt(msg, key, date)
    # @keys = Keys.new(key)
    msg.each_char do |char|
        # require 'pry'; binding.pry
        assoc_shift(msg.index(char), key)

    end
  end

  def characters
    ('a'..'z').to_a << ' '
  end

  def assoc_shift(index, key)
    # key = Key.new(key)
    # loop index - 4 until 0..3
    # require 'pry'; binding.pry
    key.a_key if index == 0
    key.b_key if index == 1
    key.c_key if index == 2
    key.d_key if index == 3
  end
end
