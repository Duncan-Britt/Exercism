=begin
Write your code for the 'Twelve Days' exercise in this file. Make the tests in
`twelve_days_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/twelve-days` directory.
=end

class TwelveDays
  def self.factory(n)
    case n
    when 1
      ["first", "a Partridge in a Pear Tree."]
    when 2
      ["second", "two Turtle Doves, and a Partridge in a Pear Tree."]
    when 3
      ["third", "three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."]
    when 4
      ["fourth", "four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."]
    when 5
      ["fifth", "five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."]
    when 6
      ["sixth", "six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."]
    when 7
      ["seventh", "seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."]
    when 8
      ["eighth", "eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."]
    when 9
      ["ninth", "nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."]
    when 10
      ["tenth", "ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."]
    when 11
      ["eleventh", "eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."]
    when 12
      ["twelfth", "twelve Drummers Drumming, eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."]
    end
  end

  def self.line(n)
    variables = factory(n)
    nth = variables[0]
    gifts = variables[1]
    "On the #{nth} day of Christmas my true love gave to me: #{gifts}"
  end

  def self.song
    whole = ''
    1.upto(11) do |n|
      whole << line(n)
      whole << "\n\n"
    end
    whole << line(12)
    whole << "\n"
  end
end
