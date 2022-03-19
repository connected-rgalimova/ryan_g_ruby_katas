class Roman
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