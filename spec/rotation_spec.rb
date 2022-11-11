require './lib/rotation'

RSpec.describe Rotation do
  let(:rotation) {Rotation.new("hello world")}

  it 'exist and starts with letters' do
    expect(rotation).to be_a(Rotation)
    expect(rotation.string).to eq("hello world")
    expect(rotation.letters).to eq(("a".."z").to_a << " ")
  end

  it 'can find a new letter based on a desired shift' do
    expect(rotation.spin("a", 7)).to eq("h")
    expect(rotation.spin("b", 27)).to eq("b")
    expect(rotation.spin("z", 10)).to eq("i")
  end
end