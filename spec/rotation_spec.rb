require './lib/rotation'

RSpec.describe Rotation do
  let(:rotation) {Rotation.new("hello world")}

  it 'exist and starts with letters' do
    expect(rotation).to be_a(Rotation)
    expect(rotation.string).to eq("hello world")
    expect(rotation.letters).to eq(("a".."z").to_a << " ")
  end

   it 'can turn message into an array' do
    expect(rotation.set_str).to eq(["h", "e", "l", "l", "o"," ", "w", "o", "r", "l", "d"])
  end

  it 'can find a new letter based on a desired shift' do
    expect(rotation.shift("a", 7)).to eq("h")
    expect(rotation.shift("b", 27)).to eq("b")
    expect(rotation.shift("z", 10)).to eq("i")
  end
  
  it 'can cipher a message with a key and date' do
    expect(rotation.cipher({:A => 3, :B=> 27, :C=> 73, :D => 20})).to eq("keder ohulw")
  end
end