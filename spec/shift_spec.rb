require './lib/shift'

RSpec.describe Shift do
    it 'exists' do
        keys = Keys.new('02715')
        offests = Offsets.new('040895')
        shifts = Shift.new(keys, offsets)
        expect(shifts.a_shift).to eq(3)
        expect(shifts.b_shift).to eq(27)
        expect(shifts.c_shift).to eq(73)
        expect(shifts.d_shift).to eq(20)

    end
end