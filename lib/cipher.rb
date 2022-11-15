module Cipher
  def characters
    ('a'..'z').to_a << ' '
  end

  def cipher(hash, shift)
    hash[hash.keys[0]].each_char.with_index do |char, index|
      if characters.index(char)
        updated = update_char(char, shift.assoc_shift(index))
        hash[hash.keys[0]][index] = updated
      end
    end
    hash
  end

  def update_char(char, shift)
    rotated_characters = characters.rotate(shift)
    rotated_characters[characters.index(char)]
  end
end
