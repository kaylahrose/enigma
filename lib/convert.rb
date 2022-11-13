module Convert
  def random_key
    n = rand(0..99_999).to_s
    n.insert(0, '0') while n.length < 5
    n
  end
end