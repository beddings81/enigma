require './lib/shift'
require 'date'

RSpec.describe Shift do
  let(:shift) {Shift.new}

  it 'exist and has attributes' do
    expect(shift).to be_a(Shift)
    expect(shift.key).to eq("")
    expect(shift.numbers).to eq(["0","1","2","3","4","5","6","7","8","9"])
  end

  it 'can take a date and create the offsets' do
    expect(shift.set_date("040895")).to eq("1025")
    expect(shift.set_date).to eq("8884")
  end

  it 'can generate a random 5 digit key' do
    expect(shift.rand_key).to be_a(String)
  end
end

