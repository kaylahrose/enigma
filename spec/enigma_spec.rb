require './lib/enigma'

RSpec.describe Enigma do
  it 'exists' do
    enigma = Enigma.new

    expect(enigma).to be_instance_of(Enigma)
  end

  it '#characters' do
    enigma = Enigma.new
    expect(enigma.characters).to eq(['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q',
                                     'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', ' '])
  end

  it '#assoc_key' do
    enigma = Enigma.new
    key = Keys.new('02715')

    expect(enigma.assoc_key(0, key)).to eq(key.a_key)


    
  end

  it '#encrypt a message' do
    enigma = Enigma.new
    expect(enigma.encrypt('hello world', '02715', '040895')).to eq({
                                                                     encryption: 'keder ohulw',
                                                                     key: '02715',
                                                                     date: '040895'
                                                                   })
  end
end
