class Calculator
  ERROR_MESSAGE = "negatives not allowed: %{negatives}"

  def self.calc(input)
    return 0 if input == ""

    numbers = parse_numbers(input)
    validate_numbers(numbers)

    numbers.sum
  end

  def self.parse_numbers(input)
    input
      .split(',')
      .map {|x| x.split("\n")}
      .flatten
      .map(&:to_i)
      .select {|x| x <= 1000}
  end

  def self.validate_numbers(numbers)
    negative_numbers = numbers.select(&:negative?)

    if negative_numbers.any?
      raise ERROR_MESSAGE % { negatives: negative_numbers.join(',') }
    end
  end
end
