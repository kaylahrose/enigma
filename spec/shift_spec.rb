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

  it '#assoc_shift' do
  key = Key.new('02715')
  offset = Offset.new('040895')
  shift = Shift.new(key, offset)
  # text = 'sak;djfn'

  expect(shift.assoc_shift(0)).to eq(shift.a_shift)
  expect(shift.assoc_shift(1)).to eq(shift.b_shift)
  expect(shift.assoc_shift(2)).to eq(shift.c_shift)
  expect(shift.assoc_shift(3)).to eq(shift.d_shift)



end
end
