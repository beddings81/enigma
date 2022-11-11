require './lib/shift'
require 'date'

RSpec.describe Shift do
  let(:shift) {Shift.new}

  it 'exist and has attributes' do
    expect(shift).to be_a(Shift)
  end
end