=begin
Write your code for the 'Run Length Encoding' exercise in this file. Make the tests in
`run_length_encoding_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/run-length-encoding` directory.
=end

module RunLengthEncoding
  def self.encode(string)
    return string if string.length <= 1
    last_chr = string[0]
    chrs = string.chars
    count = 1
    i = 1
    result = ''
    while i < string.length
      if chrs[i] == last_chr
        count += 1
      else
        result << count.to_s if count > 1
        result << last_chr
        count = 1
      end
      last_chr = chrs[i]
      i += 1
    end
    result << count.to_s if count > 1
    result << last_chr
    result
  end

  def self.decode(string)
    result = ''
    n = 1
    previous_n = false
    string.each_char do |chr|
      if chr =~ /[a-zA-Z ]/
        n.times do
          result << chr
        end
        previous_n = false
        n = 1
      else
        if previous_n
          n = n.to_s
          n << chr
          n = n.to_i
        else
          n = chr.to_i
          previous_n = true
        end
      end
    end

    result
  end
end
