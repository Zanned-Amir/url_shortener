class ShortCode
  ALAPHABET = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".freeze
  BASE = ALAPHABET.length
  def self.encode(number)
    return ALAPHABET[0] if number.zero? || number.nil?
    result = ""

    while  number > 0 do
      index = number % BASE
      char = ALAPHABET[index]
      result.prepend char
      number = number / BASE

    end

    result

  end

  def self.decode(string)
    number = 0

    string.reverse.each_char.with_index do |char, index|
      power =  BASE**index
      index = ALAPHABET.index(char)
      number += index * power

    end

    number
  end

end
