=begin
Write your code for the 'Matrix' exercise in this file. Make the tests in
`matrix_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/matrix` directory.
=end

class Matrix
  attr_accessor :rows, :columns

  def initialize(string)
    @rows = string.split("\n").map do |line|
      line.split.map { |e| e.to_i }
    end
    @columns = []
    i = 0
    while i < @rows[0].length
      j = 0
      column = []
      while j < @rows.length
        column << rows[j][i]
        j += 1
      end
      @columns << column
      i += 1
    end
  end
end
