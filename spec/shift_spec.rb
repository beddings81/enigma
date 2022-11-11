require './lib/shift'
require 'date'

RSpec.describe Shift do
  let(:shift) {Shift.new}

  it 'exist and has attributes' do
    expect(shift).to be_a(Shift)
    expect(shift.key).to eq("")
    expect(shift.numbers).to eq(["0","1","2","3","4","5","6","7","8","9"])
  end

  it 'can have a key passed in' do
    shift = Shift.new({:key => "12345"})
    expect(shift.key).to eq("12345")
  end

  it 'can have a date passed in or it defaults to today' do
    expect(shift.date).to eq(Date.today.to_s)
  end

  it 'can take a date and create the offsets' do
    expect(shift.set_offset("040895")).to eq("1025")
    expect(shift.set_offset).to eq("8884")
  end

  it 'can generate a random 5 digit key' do
    expect(shift.rand_key).to be_a(String)
  end

   it 'can take a key and format it as 4 keys' do
    expect(shift.set_key("02715")).to eq({:A => "02", :B => "27", :C => "71", :D => "15"})
  end
end

