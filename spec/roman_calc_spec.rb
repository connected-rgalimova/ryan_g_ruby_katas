require './app/roman_calc'


RSpec.describe RomanCalculator do
  subject(:rc) { described_class }

  it 'should return  III given I and II' do
    res = rc.calc('I,II')

    expect(res).to eq 3
  end

end