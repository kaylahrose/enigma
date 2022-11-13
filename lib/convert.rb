module Convert
  def new_msg(msg)
    msg.each_char.with_index do |char, index|
      new_char(char, index)
    end
    @hash
  end

  def new_char(char, index)
    if characters.index(char)
      new_i = new_index(char, index)
      @hash[@hash.keys[0]] << characters[new_i]
    else
      @hash[@hash.keys[0]] << char
    end
  end

  def new_index(char, index)
    shift = make_shifts(@hash[:key], @hash[:date])
    new_index = shift_up(char, index, shift) if @hash[:encryption]
    new_index = shift_down(char, index, shift) if @hash[:decryption]
    new_index
  end

  def shift_up(char, index, shift)
    new_index = characters.index(char) + assoc_shift(index, shift)
    new_index -= 27 while new_index > 26
    new_index
  end

  def shift_down(char, index, shift)
    new_index = characters.index(char) - assoc_shift(index, shift)
    new_index += 27 while new_index < 0
    new_index
  end
end
