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
    expected = {
      encryption: 'keder ohulw',
      key: '02715',
      date: '040895'
    }
    expect(enigma.encrypt('hello world', '02715', '040895')).to eq(expected)
    expect(enigma.encrypt('Hello World', '02715', '040895')).to eq(expected)
    expect(enigma.encrypt('Hello World?', '02715', '040895')).to eq({
      encryption: 'keder ohulw?',
      key: '02715',
      date: '040895'
    })
    expect(enigma.encrypt('He!!o World?', '02715', '040895')).to eq({
      encryption: 'ke!!r ohulw?',
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
    with_date = enigma.encrypt('hello world', '02715', Date.today.strftime('%d%m%y'))

    expect(no_date).to eq(with_date)
  end

  it "#decrypt a message with a key (uses today's date)" do
    enigma = Enigma.new
    encrypted = enigma.encrypt('hello world', '02715')
    no_date = enigma.decrypt(encrypted[:encryption], '02715')

    expect(no_date[:decryption]).to eq('hello world')
  end

  it 'generates random key with leading 0s' do
    enigma = Enigma.new

    expect(enigma.random_key).to be_a(String)
    expect(enigma.random_key.length).to eq(5)
    expect((0..99_999).include?(enigma.random_key.to_i)).to eq(true)
  end

  it '#encrypt a message (generates random key and uses todays date)' do
    enigma = Enigma.new
    encrypt_no_key = enigma.encrypt('hello world')

    expect(encrypt_no_key[:key]).to be_a(String)
    expect(encrypt_no_key[:key].length).to eq(5)
    expect((0..99_999).include?(encrypt_no_key[:key].to_i)).to eq(true)
  end

  it '#encrypt a message with uppercase letters' do
    enigma = Enigma.new
    encryption_upcase = enigma.encrypt('Hello world', '02715', '040895')
    encryption_downcase = enigma.encrypt('hello world', '02715', '040895')

    expect(encryption_upcase).to eq(encryption_downcase)
  end
end
