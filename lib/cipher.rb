module Cipher
  def cipher(text)
    text.each_char.with_index do |char, index|
      char = new_char(char, index) if characters.index(char)
      @hash[@hash.keys[0]] << char
    end
    @hash
  end

  def new_char(char, index)
    shifted_characters = shift(index)
    shifted_characters[characters.index(char)]
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
    case index
    when 0
      shift.a_shift
    when 1
      shift.b_shift
    when 2
      shift.c_shift
    when 3
      shift.d_shift
    end
  end
end
