=begin
Write your code for the 'Twelve Days' exercise in this file. Make the tests in
`twelve_days_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/twelve-days` directory.
=end

class TwelveDays
  GIFTS = "twelve Drummers Drumming, eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."

  def self.factory(n)
    case n
    when 1
      ["first", GIFTS.split(', ').slice(11..-1).join(', ').gsub("and ", "")]
    when 2
      ["second", GIFTS.split(', ').slice(10..-1).join(', ')]
    when 3
      ["third", GIFTS.split(', ').slice(9..-1).join(', ')]
    when 4
      ["fourth", GIFTS.split(', ').slice(8..-1).join(', ')]
    when 5
      ["fifth", GIFTS.split(', ').slice(7..-1).join(', ')]
    when 6
      ["sixth", GIFTS.split(', ').slice(6..-1).join(', ')]
    when 7
      ["seventh", GIFTS.split(', ').slice(5..-1).join(', ')]
    when 8
      ["eighth", GIFTS.split(', ').slice(4..-1).join(', ')]
    when 9
      ["ninth", GIFTS.split(', ').slice(3..-1).join(', ')]
    when 10
      ["tenth", GIFTS.split(', ').slice(2..-1).join(', ')]
    when 11
      ["eleventh", GIFTS.split(', ').slice(1..-1).join(', ')]
    when 12
      ["twelfth", GIFTS]
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

TwelveDays.song
