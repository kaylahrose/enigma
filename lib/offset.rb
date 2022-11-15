class Offset
  attr_reader :a_offset, :b_offset, :c_offset, :d_offset

  def initialize(date, positive = true)
    offset = transform(date)
    @a_offset = offset[0].to_i
    @b_offset = offset[1].to_i
    @c_offset = offset[2].to_i
    @d_offset = offset[3].to_i
    make_negative unless positive
  end

  def transform(date)
    (date.to_i**2).to_s[-4..]
  end

  def self.current_date
    Date.today.strftime('%d%m%y')
  end

  def make_negative
    instance_variables.each do |var|
      instance_variable_set(var, -instance_variable_get(var))
    end
  end
end
