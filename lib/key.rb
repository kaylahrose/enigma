class Key
  attr_reader :a_key, :b_key, :c_key, :d_key

  def initialize(num, positive = true)
    @a_key = num[0..1].to_i
    @b_key = num[1..2].to_i
    @c_key = num[2..3].to_i
    @d_key = num[3..4].to_i
    make_negative unless positive
  end

  def self.random_key
    '%05d' % rand(10**5)
  end

  def make_negative
    instance_variables.each do |var|
      instance_variable_set(var, -instance_variable_get(var))
    end
  end
end
