require './lib/enigma'

RSpec.describe Enigma do
  let!(:enigma) {Enigma.new}

  it 'exist' do
    expect(enigma).to be_a(Enigma)
  end

  it 'can encrypt a message with a key and date' do
    expect(enigma.cypher("hell", {:A => 3, :B => 27, :C => 73, :D => 20})).to eq("keder ohulw")
    # expect(enigma.encrypt("hello world", "02715", "040895")).to eq({encryption: "keder ohulw", key: "02715", date: "040895"})
  end
end