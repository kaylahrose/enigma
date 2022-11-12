require_relative 'keys'

class Enigma
    # attr_reader :keys

  def encrypt(msg, key, date)
    # @keys = Keys.new(key)
    msg.each_char do |char|
        # require 'pry'; binding.pry
        assoc_key(msg.index(char), key)

    end
  end

  def characters
    ('a'..'z').to_a << ' '
  end

  def assoc_key(index, key)
    keys = Keys.new(key)
    # loop index - 4 until 0..3
    # require 'pry'; binding.pry
    keys.a_key if index == 0
  end
end
