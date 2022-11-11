require './lib/rotation'

RSpec.describe Rotation do
  let(:rotation) {Rotation.new("hello world")}

  it 'exist and starts with letters' do
    expect(rotation).to be_a(Rotation)
  end
end