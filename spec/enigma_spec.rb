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
    # require 'pry'; binding.pry
    shift = Shift.new(key, offset)

    expect(enigma.assoc_shift(0, shift)).to eq(shift.a_shift)
    expect(enigma.assoc_shift(1, shift)).to eq(shift.b_shift)
    expect(enigma.assoc_shift(2, shift)).to eq(shift.c_shift)
    expect(enigma.assoc_shift(3, shift)).to eq(shift.d_shift)
    expect(enigma.assoc_shift(4, shift)).to eq(shift.a_shift)
    expect(enigma.assoc_shift(9, shift)).to eq(shift.b_shift)
  end

  it '#encrypt a message with key and date' do
    enigma = Enigma.new
    expect(enigma.encrypt('hello world', '02715', '040895')).to eq({
                                                                     encryption: 'keder ohulw',
                                                                     key: '02715',
                                                                     date: '040895'
                                                                   })
  end

  it '#decrypt a message with key and date' do
    enigma = Enigma.new

    expect(enigma.decrypt('keder ohulw', '02715', '040895')).to eq({
                                                                     decryption: 'hello world',
                                                                     key: '02715',
                                                                     date: '040895'
                                                                   })
  end

  it '#encrypt a message with a key (uses todays date)' do
    enigma = Enigma.new
    no_date = enigma.encrypt('hello world', '02715')
    with_date = enigma.encrypt('hello world', '02715', '121122')

    expect(no_date).to eq(with_date)
  end

  it "#decrypt a message with a key (uses today's date)" do
    enigma = Enigma.new

    encrypted = enigma.encrypt('hello world', '02715')
    no_date = enigma.decrypt(encrypted[:encryption], '02715')
    expect(no_date[:decryption]).to eq('hello world')
  end
end
