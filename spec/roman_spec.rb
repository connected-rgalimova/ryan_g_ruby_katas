require './app/roman'

RSpec.describe Roman do
  it "Given a Roman Numeral, return as an Integer" do 
    input = 'VI'

    result = Roman.calc(input)

    expect(result).to eq 6
  end
end