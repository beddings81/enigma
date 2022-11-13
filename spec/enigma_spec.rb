require './lib/enigma'

RSpec.describe Enigma do
  let!(:enigma) {Enigma.new}

  it 'exist' do
    expect(enigma).to be_a(Enigma)
  end

  it 'can encrypt a message with a key and date' do
    expect(enigma.encrypt("hello world", "02715", "040895")).to eq({:date=>"040895", :encryption=>"keder ohulw", :key=>"02715"})
    expect(enigma.encrypt("HELLO WORLD", "02715", "040895")).to eq({:date=>"040895", :encryption=>"keder ohulw", :key=>"02715"})
  end


  it 'can decrypt a message with a key and date' do
    expect(enigma.decrypt("keder ohulw", "02715", "040895")).to eq({:date=>"040895", :encryption=>"hello world", :key=>"02715"})
    expect(enigma.decrypt("KEDER OHULW", "02715", "040895")).to eq({:date=>"040895", :encryption=>"hello world", :key=>"02715"})
  end

  it 'can encrypt a message with a key (uses todays date)' do
    expect(enigma.encrypt("HELLO WORLD", "02715")).to eq({:date=>"121122", :encryption=>"rmjdyhugatb", :key=>"02715"})
  end

  it 'can decrypt a message with a key (uses todays date)' do
    expect(enigma.decrypt("KEDER OHULW", "02715")).to eq({:date=>"121122", :encryption=>"axfmhsqpkdy", :key=>"02715"})
  end
end