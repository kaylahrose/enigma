require './lib/keys'

RSpec.describe Keys do
  it 'exists' do
    keys = Keys.new("02715")
    
    expect(keys.a_key).to eq(02)
    expect(keys.b_key).to eq(27)
    expect(keys.c_key).to eq(71)
    expect(keys.d_key).to eq(15)
  end
end
