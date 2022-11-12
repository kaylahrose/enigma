class Offset
  attr_reader :a_offset, :b_offset, :c_offset, :d_offset

  def initialize(date)
    offset = (date.to_i**2).to_s[-4..-1]
    @a_offset = offset[0].to_i
    @b_offset = offset[1].to_i
    @c_offset = offset[2].to_i
    @d_offset = offset[3].to_i
  end
end
