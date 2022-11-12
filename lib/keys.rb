class Keys
  attr_reader :a_key, :b_key, :c_key, :d_key

  def initialize(num)
    @a_key = num[0..1]
    @b_key = num[1..2]
    @c_key = num[2..3]
    @d_key = num[3..4]
  end

  def sanitize(num); end
end
