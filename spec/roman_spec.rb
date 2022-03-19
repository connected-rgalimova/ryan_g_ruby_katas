require './app/roman'

RSpec.describe Roman do
  it "Given a Roman Numeral, return as an Integer 3" do 
    input = 'III'

    result = Roman.calc(input)

    expect(result).to eq 3
  end

  it "Given a Roman Numeral IV , return as an Integer 4" do
    input = 'IV'

    result = Roman.calc(input)

    expect(result).to eq 4
  end

  it "Given a Roman Numeral XIV , return as an Integer 14" do 
    input = 'XIV'

    result = Roman.calc(input)

    expect(result).to eq 14
  end

  it "Given a Roman Numeral XXXIX, return as an Integer 39" do 
    input = 'XXXIX'

    result = Roman.calc(input)

    expect(result).to eq 39
  end

  it "Given a Roman Numeral CCXLVI, return as an Integer 246" do
    input = 'CCXLVI'

    result = Roman.calc(input)

    expect(result).to eq 246
  end

  it "Given a Roman Numeral DCCLXXXIX, return as an Integer 789 " do
    input = 'DCCLXXXIX'

    result = Roman.calc(input)

    expect(result).to eq 789
  end

  it "Given a Roman Numeral MMCDXXI, return as an Integer 2,421 " do
    input = 'MMCDXXI'

    result = Roman.calc(input)

    expect(result).to eq 2421
  end
  it "Given a Roman Numeral MLXVI, return as an Integer 1,066 " do 
    input = 'MLXVI'

    result = Roman.calc(input)

    expect(result).to eq 1066
  end

  it "Given a Roman Numeral CLX, return as an Integer 160 " do
    input = 'CLX'

    result = Roman.calc(input)

    expect(result).to eq 160
  end
  it "Given a Roman Numeral  CCVII, return as an Integer 207" do
    input = 'CCVII'

    result = Roman.calc(input)

    expect(result).to eq 207
  end
  it "Given a Roman Numeral  MIX, return as an Integer 1,009" do 
    input = 'MIX'

    result = Roman.calc(input)

    expect(result).to eq 1009
  end
end

# logic cases:

# additve, one numeral type: 1-3 => I, II, III
# additive multiple type 6-8 => VI, VII, VIII
# subtractive, multiple numeral types 4, 9 => IV, IX
# chunking logic => 11 => 10 + 1 => X + I => XI

# traverse from right to left:
# if greater than the prior one, then add
# otherwise subtract and mark end of chunk

