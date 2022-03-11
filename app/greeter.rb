# class GreeterHelpers
#   def self.checkTime(time, formatted_name)
#     sixam = Time.parse('6:00 am')
#     twelvepm = Time.parse('12:00 pm')
  
#     sixpm = Time.parse('6:00 pm')
#     tenpm = Time.parse('10:00 pm')
  
#     morning = sixam..twelvepm
#     afternoon = twelvepm..sixpm
#     evening = sixpm..tenpm
  
#      if !time
#       return "Hello " + formatted_name
#     end
#     if morning.include?(time)
#       return "Good morning #{formatted_name}"
#     elsif evening.include?(time)
#       return "Good evening #{formatted_name}"
#     elsif afternoon.include?(time)
#       return "Hello #{formatted_name}"
#     else
#       return "Good night #{formatted_name}"
#     end    
#   end
# end

class Greeter
  attr_reader :time, :template

  def self.greet(template, name:, time: nil)
    new(template: template, time: time).greet(name)
  end

  def initialize(template:, time: nil)
    @time = time
    @template = template
  end

  def greet(name)
    formatted_name = name.strip.capitalize
    result = checkTime(formatted_name)

    print (result)

    return result
  end

  private

  def checkTime(formatted_name)
    sixam = Time.parse('6:00 am')
    twelvepm = Time.parse('12:00 pm')
  
    sixpm = Time.parse('6:00 pm')
    tenpm = Time.parse('10:00 pm')
  
    morning = sixam..twelvepm
    afternoon = twelvepm..sixpm
    evening = sixpm..tenpm
  
     if !time
      return template[:default] % {name: formatted_name}
    end
    if morning.include?(time)
      return template[:morning] % {name: formatted_name}
    elsif evening.include?(time)
      return template[:evening] % {name: formatted_name}
    else
      return template[:night] % {name: formatted_name}
      # return "Good night #{formatted_name}"
    end    
  end
end



