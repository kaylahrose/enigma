module Cipher

  def characters
    ('a'..'z').to_a << ' '
  end

  def make_shifts(key_num, date)
    key = Key.new(key_num)
    offset = Offset.new(date)
    Shift.new(key, offset)
  end

  def cipher(text, info)
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
