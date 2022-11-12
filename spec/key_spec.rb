require './lib/key'

RSpec.describe Key do
  it 'exists' do
    key = Key.new('02715')

    expect(key.a_key).to eq(0o2)
    expect(key.b_key).to eq(27)
    expect(key.c_key).to eq(71)
    expect(key.d_key).to eq(15)
  end
end
