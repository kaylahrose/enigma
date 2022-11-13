require './lib/offset'

RSpec.describe Offset do
  it 'exists' do
    offset = Offset.new('040895')
    expect(offset).to be_instance_of(Offset)
    expect(offset.a_offset).to eq(1)
    expect(offset.b_offset).to eq(0)
    expect(offset.c_offset).to eq(2)
    expect(offset.d_offset).to eq(5)
  end
  
  it '#transform' do
  offset = Offset.new('040895')
  expect(offset.transform('040895')).to eq('1025')
  # require 'pry'; binding.pry
  

end
end
