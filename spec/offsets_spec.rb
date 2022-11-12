require './lib/offsets'

RSpec.describe Offsets do
    it 'exists' do
        offset = Offsets.new('040895')
        expect(offset.a_offset).to eq(1)
    end
end