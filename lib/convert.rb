module Convert
  def random_key
    n = rand(0..99_999).to_s
    n.insert(0, '0') while n.length < 5
    n
  end

  def make_shifts(key_num, date)
    key = Key.new(key_num)
    offset = Offset.new(date)
    Shift.new(key, offset)
  end

  def current_date
    Date.today.strftime('%d%m%y')
  end

  def new_msg(msg)
    msg.each_char.with_index do |char, index|
        new_char(char, index)
      #   if characters.index(char)
      #     new_i = new_index(char,index)
      #     @hash[@hash.keys[0]] << characters[new_i]
      #   else
      #     @hash[@hash.keys[0]] << char
      #   end
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
