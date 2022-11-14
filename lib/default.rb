module Default

  def make_shifts(key_num, date)
    key = Key.new(key_num)
    offset = Offset.new(date)
    Shift.new(key, offset)
  end

  def characters
    ('a'..'z').to_a << ' '
  end
end
