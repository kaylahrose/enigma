module Cipher
  def cipher(text)
    text.each_char.with_index do |char, index|
      new_char(char, index)
      @hash[@hash.keys[0]] << new_char(char, index)
    end
    @hash
  end

  def new_char(char, index)
    if characters.index(char)
      shifted_characters = shift(index)
      char = shifted_characters[characters.index(char)]
    end
    char
    # @hash[@hash.keys[0]] << char
  end

  def shift(index)
    shift = make_shifts(@hash[:key], @hash[:date])
    shift = if @hash[:encryption]
              assoc_shift(index, shift)
            else
              -assoc_shift(index, shift)
            end
    characters.rotate(shift)
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
