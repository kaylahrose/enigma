class Shift
  attr_reader :a_shift, :b_shift, :c_shift, :d_shift

  def initialize(key, offset)
    @a_shift = key.a_key + offset.a_offset
    @b_shift = key.b_key + offset.b_offset
    @c_shift = key.c_key + offset.c_offset
    @d_shift = key.d_key + offset.d_offset
  end

  def assoc_shift(index)
    index -= 4 while index > 3
    case index
    when 0
      a_shift
    when 1
      b_shift
    when 2
      c_shift
    when 3
      d_shift
    end
  end
end
