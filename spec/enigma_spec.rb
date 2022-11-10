require './lib/enigma'

RSpec.describe Enigma do
  let!(:enigma) {Enigma.new}

  it 'exist' do
    expect(enigma).to be_a(Enigma)
  end

  it 'has a character set' do
    expect(enigma.character_set).to eq(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "])
  end

  it 'can slit a message' do
    expect(enigma.spliter("hello")).to eq(["h", "e", "l", "l", "o"])
  end

  it 'can take a date and create the offsets' do
    expect(enigma.offseter("040895")).to eq(1025)
  end

  it 'can take the keys and offsets to make a shift' do
    expect(enigma.shift([02,27,71,15], [1,0,2,5])).to eq({:A => 3, :B => 27, :C => 73, :D => 20})
  end

  xit 'can encrypt a message with a key and date' do
    expect(enigma.encrypt("hello world", "02715", "040895")).to eq({encryption: "keder ohulw", key: "02715", date: "040895"})
  end
end