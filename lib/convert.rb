module Convert
  def random_key
    n = rand(0..99_999).to_s
    n.insert(0, '0') while n.length < 5
    n
  end

  def current_date
    Date.today.strftime('%d%m%y')
  end

  def new_char(msg, shift)
    msg.each_char.with_index do |char, index|
      if characters.index(char).nil?
        @e[:encryption] << char
      else
        new_index = shift_up(char, index, shift)
        @e[:encryption] << characters[new_index]
      end
    end
  end

  def dnew_char(msg, _shift)
    msg.each_char.with_index do |_char, _index|
      @d[:decryption] << characters[new_index]
    end
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
