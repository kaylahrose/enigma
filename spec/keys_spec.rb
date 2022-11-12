require './lib/keys'

RSpec.describe Keys do
  it 'exists' do
    keys = Keys.new("02715")
    
    expect(keys.a_key).to eq('02')
  end

  xit '#sanitize' do
  keys = Keys.new("02715")
  expect(keys.sanitize("02")).to eq(02)

end

  xit '#random_num' do
  keys = Keys.new
#   expect(keys.random_num).to be_a



end
end
