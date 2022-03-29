class IntegerToRoman
  CONVERSION = [
    [1000, 'M'],
    [500, 'D'],
    [100, 'C'],
    [50, 'L'],
    [10, 'X'],
    [5, 'V'],
    [1, 'I']
  ]

  def self.calc(input)
    puts input
    remainder = input
    result = ''
    index = 0
    
    while index < CONVERSION.size
      decimal_key = CONVERSION[index][0]
      # print 'decimal_key '
      # puts decimal_key

      roman_value = CONVERSION[index][1]
      # print 'roman_value '
      # puts roman_value

      # figure out how many V's
      # i.e. figure out how many times 5 divides into input
      number_of_numerals = remainder / decimal_key
      # print 'number_of_numerals '
      # puts number_of_numerals

      remainder = remainder % decimal_key
      # print 'remainder '
      # puts remainder

      result = result + roman_value * number_of_numerals

      # We are done
      if (remainder == 0)
        index = CONVERSION.size
        break
      end

      # if remainder is 4, then we want IV instead of IIII
      if(index + 1 < CONVERSION.size)
        next_decimal_key = CONVERSION[index + 1][0]
        if (decimal_key / next_decimal_key == 5) 
          next_remainder = remainder % next_decimal_key
          if (remainder - next_remainder == (decimal_key - next_decimal_key))
            result = result + CONVERSION[index + 1][1] + roman_value
            remainder = next_remainder
          end
        # if remainder is 9, then we want IX instead of VIIII
        else
          next_decimal_key = CONVERSION[index + 2][0]
          next_remainder = remainder % next_decimal_key
          if (remainder - next_remainder == (decimal_key - next_decimal_key))
            result = result + CONVERSION[index + 2][1] + roman_value
            index = index + 1
            remainder = next_remainder
          end
        end
      
      end
      index = index + 1
    end
    
    return result
  end
end

class RomanToInteger
  CONVERSION = {
    'I' => 1,
    'V' => 5,
    'X' => 10,
    'L' => 50,
    'C' => 100,
    'D' => 500,
    'M' => 1000
  }

  def self.calc (n)
    acc = 0
    prev = 0 # starts new chuck
    n.chars.reverse.each do |x|
      if (prev == 0)
        # move on to the next digit
        prev = CONVERSION[x] 
      elsif (CONVERSION[x] >= prev )
        # continuing aggregating the chunk
        acc = acc + prev 
        prev = CONVERSION[x]
      else
        # finish the chunk, start a new one when
        # lower numeral is before higher (e.g IX = 9)
        acc = acc + prev - CONVERSION[x]
        prev = 0
      end
    end
    return acc + prev
  end
end