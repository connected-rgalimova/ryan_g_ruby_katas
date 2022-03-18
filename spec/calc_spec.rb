require './app/calc'

RSpec.describe Calculator do
  it "An empty string returns zero" do 
    input = ''

    result = Calculator.calc(input)

    expect(result).to eq 0
  end

  it "A single number returns the value" do 
    input = '1'

    result = Calculator.calc(input)

    expect(result).to eq 1
  end

  it "Three numbers, delimited either way, returns the sum" do
    input = "1\n2,3\n4"

    result = Calculator.calc(input)

    expect(result).to eq 10
  end

  it "Negative numbers throw an exception with the message" do
    input = "-1,2,-3"

    expect { Calculator.calc(input) }.to raise_error('negatives not allowed: -1,-3')
  end

  it "Numbers greater than 1000 are ignored" do
    input = "999,1000,1001,1"

    result = Calculator.calc(input)

    expect(result).to eq 2000
  end

  # simplifying assumption: only split by newline and custom delimiter when a custom delimiter is given
  it "A single char delimiter can be defined on the first line starting with `//`" do
    input = "//#\n1#2"

    result = Calculator.calc(input)

    expect(result).to eq 3
  end

  it "A multi char delimiter can be defined on the first line starting with //" do
    input = "//ab\n1ab2"

    result = Calculator.calc(input)

    expect(result).to eq 3
  end
end
