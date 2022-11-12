require './lib/enigma'

RSpec.describe Enigma do
  let!(:enigma) {Enigma.new}

  it 'exist' do
    expect(enigma).to be_a(Enigma)
  end

  it 'can encrypt a message with a key and date' do
    expect(enigma.encrypt("hello world", "02715", "040895")).to eq("{encryption: => rmjdyhugatb,\n      key:        => 02715,\n      date:       => 040895\n    }")
    expect(enigma.encrypt("HELLO WORLD", "02715", "040895")).to eq("{encryption: => rmjdyhugatb,\n      key:        => 02715,\n      date:       => 040895\n    }")
  end
end