require './lib/enigma'
require './lib/rotation'

RSpec.describe Enigma do
  let!(:enigma) {Enigma.new}

  it 'exist' do
    expect(enigma).to be_a(Enigma)
  end

  it 'can encrypt a message with a key and date' do
    expect(enigma.encrypt("hell!o world!", "02715", "040895")).to eq({:date=>"040895", :encryption=>"kede!r ohulw!", :key=>"02715"})
    expect(enigma.encrypt("HELLO WORLD", "02715", "040895")).to eq({:date=>"040895", :encryption=>"keder ohulw", :key=>"02715"})
  end


  it 'can decrypt a message with a key and date' do
    expect(enigma.decrypt("kede!r ohulw!", "02715", "040895")).to eq({:date=>"040895", :decryption=>"hell!o world!", :key=>"02715"})
    expect(enigma.decrypt("KEDER OHULW", "02715", "040895")).to eq({:date=>"040895", :decryption=>"hello world", :key=>"02715"})
  end

  it 'can encrypt a message with a key (uses todays date)' do
    allow(enigma).to receive(:today).and_return("131122")
    expect(enigma.encrypt("HELLO WORLD", "02715")).to eq({:date=>"131122", :encryption=>"rmjdyhugatb", :key=>"02715"})
  end

  it 'can decrypt a message with a key (uses todays date)' do
    allow(enigma).to receive(:today).and_return("131122")
    expect(enigma.decrypt("KEDER OHULW", "02715")).to eq({:date=>"131122", :decryption=>"axfmhsqpkdy", :key=>"02715"})
  end

  it 'can encrypt a message (generates random key and uses todays date)' do
    allow(enigma).to receive(:today).and_return("131122")
    allow(enigma).to receive(:rand_key).and_return("77667")
    expect(enigma.encrypt("hello world")).to eq({:date=>"131122", :encryption=>"lhebscpevox", :key=>"77667"})
  end

  it 'can test for todays date' do
    expected_date = Date.today.strftime("%d%m%y")
    expect(enigma.today).to eq(expected_date)
  end

  it 'can take a date and create the offsets' do
    expect(enigma.set_offset("040895")).to eq("1025")
    expect(enigma.set_offset).to eq("8884")
  end

  it 'can generate a random 5 digit key' do
    allow(enigma).to receive(:rand_key).and_return("12345")
    expect(enigma.rand_key).to be_a(String)
    expect(enigma.rand_key).to eq("12345")
  end
end