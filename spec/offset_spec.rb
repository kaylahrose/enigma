require './lib/offset'

RSpec.describ Offset do
    it 'exists' do
        offset = Offset.new('040895')
        expect(offset.a_offset).to eq(1)
    end
end