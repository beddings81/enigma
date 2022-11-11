require './lib/shift'
require 'date'

RSpec.describe Shift do
  let(:shift) {Shift.new}

  it 'exist and has attributes' do
    expect(shift).to be_a(Shift)
    expect(shift.key).to eq("")
  end

  it 'can take a date and create the offsets' do
    expect(shift.set_date("040895")).to eq([1,0,2,5])
    expect(shift.set_date.to eq([8,8,8,4])
  end
end