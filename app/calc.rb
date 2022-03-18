class Calculator
  ERROR_MESSAGE = "negatives not allowed: %{negatives}"

  attr_reader :lines

  def self.calc(input)
    new(input).calc
  end

  def initialize(input)
    @lines = input.split("\n")

  end

  def calc
    return 0 if lines.empty?

    validate_numbers
    numbers.sum

    # input
    #   .map(&method(:parse))
    #   .each(&method(:validate_numbers))

  end

  private
  def numbers
    @numbers ||= parse_numbers
  end

  def delimiter
    custom_delimiter? ? lines.first[2..] : ','
  end

  def lines_to_parse
    custom_delimiter? ? lines[1..] : lines
  end

  def custom_delimiter?
    @custom_delimiter ||= lines.first[0..1] == "//"
  end

  def parse_numbers
    lines_to_parse
      .map(&method(:split))
      .flatten
      .map(&:to_i)
      .select {|x| x <= 1000}
  end

  def split(line)
    line.split(delimiter)
  end

  def validate_numbers
    negative_numbers = numbers.select(&:negative?)

    if negative_numbers.any?
      raise ERROR_MESSAGE % { negatives: negative_numbers.join(',') }
    end
  end
end
