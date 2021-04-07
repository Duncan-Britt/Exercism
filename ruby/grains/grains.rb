# Optimized for readability
module Grains
  def self.square(n)
    if n < 1 || n > 64
      raise ArgumentError
    end
    2**(n-1)
  end

  def self.total
    result = 0
    1.upto(64) do |n|
      result += square(n)
    end
    result
  end
end

# Optimized for speed
module Grains
  def self.square(n)
    if n < 1 || n > 64
      raise ArgumentError
    end
    2**(n-1)
  end

  def self.total
    result = 1
    i = 1
    cache = 1
    loop do
      break if i == 64
      result += (cache *= 2)
      i += 1
    end
    result
  end
end

# Optimized for speed 2
module Grains
  def self.square(n)
    if n < 1 || n > 64
      raise ArgumentError
    end
    1 << (n-1)
  end

  def self.total
    result = 1
    i = 1
    cache = 1
    loop do
      break if i == 64
      result += (cache = cache << 1)
      i += 1
    end
    result
  end
end
