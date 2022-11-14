class Key
  attr_reader :a_key, :b_key, :c_key, :d_key

  def initialize(num)
    @a_key = num[0..1].to_i
    @b_key = num[1..2].to_i
    @c_key = num[2..3].to_i
    @d_key = num[3..4].to_i
  end

  def self.random_key
    n = rand(0..99_999).to_s
    n.insert(0, '0') while n.length < 5
    n
  end
end