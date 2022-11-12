require './lib/enigma'
require './lib/offset'
require './lib/shift'


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

  it '#assoc_shift' do
    enigma = Enigma.new
    key = Key.new('02715')
    offset = Offset.new('040895')
    shift = Shift.new(key, offset)

    expect(enigma.assoc_shift(0)).to eq(shift.a_shift)
    expect(enigma.assoc_shift(1))


    
  end

  xit '#encrypt a message' do
    enigma = Enigma.new
    expect(enigma.encrypt('hello world', '02715', '040895')).to eq({
                                                                     encryption: 'keder ohulw',
                                                                     key: '02715',
                                                                     date: '040895'
                                                                   })
  end
end
