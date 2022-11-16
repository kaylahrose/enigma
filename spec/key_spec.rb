require './lib/key'

RSpec.describe Key do
  it 'exists' do
    key = Key.new('02715')

    expect(key.a_key).to eq(0o2)
    expect(key.b_key).to eq(27)
    expect(key.c_key).to eq(71)
    expect(key.d_key).to eq(15)

    key = Key.new('00005')

    expect(key.a_key).to eq(0o0)
    expect(key.b_key).to eq(0o0)
    expect(key.c_key).to eq(0o0)
    expect(key.d_key).to eq(0o5)
  end

  it 'generates random key with leading 0s' do
    expect(Key.random_key).to be_a(String)
    expect(Key.random_key.length).to eq(5)
    expect((0..99_999).include?(Key.random_key.to_i)).to eq(true)
  end

  it '#make_negative' do
    key = Key.new('02715')
    key.make_negative

    expect(key.a_key).to eq(-2)
    expect(key.b_key).to eq(-27)
    expect(key.c_key).to eq(-71)
    expect(key.d_key).to eq(-15)
  end
end
