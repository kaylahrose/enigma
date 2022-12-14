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
    offset = Offset.new('121122')
    expect(offset.transform('121122')).to eq('8884')
  end

  it '#current_date' do
    allow(Offset).to receive(:current_date).and_return(Date.new(1995, 8, 0o4).strftime('%d%m%y'))
    expect(Offset.current_date).to eq('040895')
  end

  it '#make_negative' do
    offset = Offset.new('040895')
    offset.make_negative
    expect(offset.a_offset).to eq(-1)
    expect(offset.b_offset).to eq(0)
    expect(offset.c_offset).to eq(-2)
    expect(offset.d_offset).to eq(-5)
  end
end
