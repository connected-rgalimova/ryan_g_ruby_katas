require './app/greeter'
require 'time'

# Write a Greeter class with greet function that receives a name as input and outputs Hello <name>. 
# The signature of greet should not change throughout the kata. 
# You are allowed to construct Greeter object as you please.

RSpec.describe 'Greeter' do
  describe '#greet' do
     before do 
      @en_greeting_template = {
        morning: "Good MORNING %{name}",
        evening: "Good EVENING %{name}",
        night: "Good NIGHT %{name}",
        default: "HELLO %{name}"
      }
    end

    it "receives a name as input and outputs HELLO <name>" do
      # greeter = Greeter.new
      # result = greeter.greet('Ryan')

      result = Greeter.greet(@en_greeting_template, name: 'Ryan')

      expect(result).to eq 'HELLO Ryan'
    end

    it "greet trims the input" do
      greeter = Greeter.new(template: @en_greeting_template)
      result = greeter.greet(' Paul  ')

      expect(result).to eq 'HELLO Paul'
    end

    it "greet capitalizes the first letter of the name" do
      greeter = Greeter.new(template: @en_greeting_template)
      result = greeter.greet('frank')

      expect(result).to eq 'HELLO Frank'
    end

    it "greet returns `Good morning <name>` when the time is 06:00-12:00" do
      eightam = Time.parse("8:00am")
      # greeter = Greeter.new(time: eightam)

      # result = greeter.greet('frank')

      result = Greeter.greet(@en_greeting_template, name: 'frank', time: eightam)

      expect(result).to eq 'Good MORNING Frank'
    end

    it "greet returns Good evening <name> when the time is 18:00-22:00" do
      eightpm = Time.parse("8:00pm")
      greeter = Greeter.new(template: @en_greeting_template, time: eightpm)

      result = greeter.greet('frank')

      expect(result).to eq 'Good EVENING Frank'
    end

    it "greet returns `Good night <name>` when the time is 22:00-06:00" do
      twelveam = Time.parse("12:00am")
      greeter = Greeter.new(template: @en_greeting_template, time: twelveam)

      result = greeter.greet('frank')

      expect(result).to eq 'Good NIGHT Frank'
    end

    it "greet logs into console each time it is called" do
      greeter = Greeter.new(template: @en_greeting_template)

      result = greeter.greet('Bob')

      expect do
        greeter.greet('Bob')
      end.to output('HELLO Bob').to_stdout
    end

  end
end

# RSpec.describe 'checkTime' do
#   it "receives a name as input and outputs Hello <name>" do
#     result = GreeterHelpers.checkTime(Time.parse('7:00 am'), "Ryan")
#     expect(result).to eq 'Good morning Ryan'
#   end
# end