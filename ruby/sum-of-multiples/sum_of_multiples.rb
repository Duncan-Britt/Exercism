
class SumOfMultiples
  def initialize(*factors)
    @factors = factors.uniq
  end

  def to(max)
    result = 0
    begin
      factors.min.upto(max-1) do |n|
        result += n if is_multiple?(n)
      end
    rescue
      return 0
    end
    result
  end

  private
  def is_multiple?(n)
    factors.any? do |factor|
      (n % factor).zero?
    end
  end

  attr_accessor :factors
end
