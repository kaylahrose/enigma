module Cipher
  def cipher(text)
    text.each_char.with_index do |char, index|
      char = update_char(char, index) if characters.index(char)
      @hash[@hash.keys[0]] << char
    end
    @hash
  end

  def update_char(char, index)
    rotated_characters = shift(index)
    rotated_characters[characters.index(char)]
  end

  def shift(index)
    shift = make_shifts(@hash[:key], @hash[:date])
    shift = if @hash[:encryption]
              shift.assoc_shift(index)
            else
              -shift.assoc_shift(index)
            end
    characters.rotate(shift)
  end
end
