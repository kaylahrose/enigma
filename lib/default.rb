module Default
#   def random_key
#     n = rand(0..99_999).to_s
#     n.insert(0, '0') while n.length < 5
#     n
#   end

  def make_shifts(key_num, date)
    key = Key.new(key_num)
    offset = Offset.new(date)
    Shift.new(key, offset)
  end

  def current_date
    Date.today.strftime('%d%m%y')
  end

  def characters
    ('a'..'z').to_a << ' '
  end
end
