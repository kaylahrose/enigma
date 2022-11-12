class Offsets
    attr_reader :a_offset, :b_offset, :c_offset, :d_offset

    def initialize(date)
        offsets = (date.to_i**2).to_s[-4..-1]
        @a_offset = offsets[0].to_i
        @b_offset = offsets[1].to_i
        @c_offset = offsets[2].to_i
        @d_offset = offsets[3].to_i
    end
end