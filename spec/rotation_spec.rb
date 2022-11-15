require './lib/rotation'

RSpec.describe Rotation do
  let(:rotation) {Rotation.new}

  it 'exist and starts with letters' do
    expect(rotation).to be_a(Rotation)
    expect(rotation.letters).to eq(("a".."z").to_a << " ")
    expect(rotation.counter).to eq(0)
  end

  it 'can find the A shift' do
    shifted = ["d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " ", "a", "b", "c"]
    expect(rotation.a_shift({:A => 3, :B=> 27, :C=> 73, :D => 20})).to eq(shifted)
  end

  it 'can find the B shift' do
     shifted = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    expect(rotation.b_shift({:A => 3, :B=> 27, :C=> 73, :D => 20})).to eq(shifted)
  end

  it 'can find the C shift' do
     shifted = ["t", "u", "v", "w", "x", "y", "z", " ", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s"]
    expect(rotation.c_shift({:A => 3, :B=> 27, :C=> 73, :D => 20})).to eq(shifted)
  end

  it 'can find the D shift' do
     shifted = ["u", "v", "w", "x", "y", "z", " ", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t"]
    expect(rotation.d_shift({:A => 3, :B=> 27, :C=> 73, :D => 20})).to eq(shifted)
  end

  it 'can find the index position of a letter' do
    expect(rotation.index("a")).to eq(0)
    expect(rotation.index("i")).to eq(8)
    expect(rotation.index("q")).to eq(16)
    expect(rotation.index("z")).to eq(25)
  end
  
  it 'can cipher a message with a key and date' do
    expect(rotation.cipher("Hello worLd", {:A => 3, :B=> 27, :C=> 73, :D => 20})).to eq("keder ohulw")
  end

  it 'can take a shift and make it negative' do
    shift = {:A => 7, :B => 24, :C => 3, :D => 0}
    rotation.reverse_shift(shift)
    expect(shift).to eq({:A => -7, :B => -24, :C => -3, :D => -0})
  end

  it 'can decrypt a message given the shifts' do
    expect(rotation.reverse("Keder ohUlw", {:A => 3, :B=> 27, :C=> 73, :D => 20})).to eq("hello world")
  end
end