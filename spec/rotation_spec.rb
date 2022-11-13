require './lib/rotation'

RSpec.describe Rotation do
  let(:rotation) {Rotation.new}

  it 'exist and starts with letters' do
    expect(rotation).to be_a(Rotation)
    expect(rotation.letters).to eq(("a".."z").to_a << " ")
  end

  it 'can find a new letter based on a desired shift' do
    expect(rotation.shift("a", 7)).to eq("h")
    expect(rotation.shift("b", 27)).to eq("b")
    expect(rotation.shift("z", 10)).to eq("i")
  end
  
  it 'can cipher a message with a key and date' do
    expect(rotation.cipher({:A => 3, :B=> 27, :C=> 73, :D => 20})).to eq("keder ohulw")
  end

  it 'can take a shift and make it negative' do
    shift = {:A => 7, :B => 24, :C => 3, :D => 0}
    rotation.reverse_shift(shift)
    expect(shift).to eq({:A => -7, :B => -24, :C => -3, :D => -0})
  end

  it 'can decrypt a message given the shifts' do
    expect(rotation.undo("Keder ohUlw", {:A => 3, :B=> 27, :C=> 73, :D => 20})).to eq("hello world")
  end
end