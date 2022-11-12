require './lib/shift'
require './lib/key'
require './lib/offset'

RSpec.describe Shift do
  it 'exists' do
    key = Key.new('02715')
    offset = Offset.new('040895')
    shift = Shift.new(key, offset)
    expect(shift.a_shift).to eq(3)
    expect(shift.b_shift).to eq(27)
    expect(shift.c_shift).to eq(73)
    expect(shift.d_shift).to eq(20)
  end
end
