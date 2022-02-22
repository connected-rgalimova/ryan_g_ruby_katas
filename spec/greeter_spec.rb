require './app/greeter'
require 'time'

# Write a Greeter class with greet function that receives a name as input and outputs Hello <name>. 
# The signature of greet should not change throughout the kata. 
# You are allowed to construct Greeter object as you please.

RSpec.describe 'Greeter' do
  describe '#greet' do
    it "receives a name as input and outputs Hello <name>" do
      # greeter = Greeter.new
      # result = greeter.greet('Ryan')

      result = Greeter.greet(name: 'Ryan')

      expect(result).to eq 'Hello Ryan'
    end

    it "greet trims the input" do
      greeter = Greeter.new
      result = greeter.greet(' Paul  ')

      expect(result).to eq 'Hello Paul'
    end

    it "greet capitalizes the first letter of the name" do
      greeter = Greeter.new
      result = greeter.greet('frank')

      expect(result).to eq 'Hello Frank'
    end

    it "greet returns `Good morning <name>` when the time is 06:00-12:00" do
      eightam = Time.parse("8:00am")
      # greeter = Greeter.new(time: eightam)

      # result = greeter.greet('frank')

      result = Greeter.greet(name: 'frank', time: eightam)

      expect(result).to eq 'Good morning Frank'
    end

    it "greet returns Good evening <name> when the time is 18:00-22:00" do
      eightpm = Time.parse("8:00pm")
      greeter = Greeter.new(time: eightpm)

      result = greeter.greet('frank')

      expect(result).to eq 'Good evening Frank'
    end

    it "greet returns `Good night <name>` when the time is 22:00-06:00" do
      twelveam = Time.parse("12:00am")
      greeter = Greeter.new(time: twelveam)

      result = greeter.greet('frank')

      expect(result).to eq 'Good night Frank'
    end

    it "greet logs into console each time it is called" do
      greeter = Greeter.new

      result = greeter.greet('Bob')

      expect do
        greeter.greet('Bob')
      end.to output('Hello Bob').to_stdout
    end

  end
end

# RSpec.describe 'checkTime' do
#   it "receives a name as input and outputs Hello <name>" do
#     result = GreeterHelpers.checkTime(Time.parse('7:00 am'), "Ryan")
#     expect(result).to eq 'Good morning Ryan'
#   end
# end