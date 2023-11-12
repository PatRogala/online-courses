class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(chars)
    chars.all? { |char| POSSIBLE_PEGS.has_key?(char.upcase) }
  end

  def self.random(length)
    arr = []
    length.times { arr << POSSIBLE_PEGS.keys.sample }
    Code.new(arr)
  end

  def self.from_string(str)
    Code.new(str.split(''))
  end

  attr_reader :pegs

  def initialize(chars)
    if Code.valid_pegs?(chars)
      @pegs = chars.map(&:upcase)
    else
      raise 'invalid pegs'
    end
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(code)
    count = 0
    @pegs.each_with_index { |peg, i| count += 1 if peg == code[i] }
    count
  end

  def num_near_matches(code)
    count = 0
    code.pegs.each_with_index do |peg, i|
      if peg != @pegs[i] && @pegs.include?(peg)
        count += 1
      end
    end
    count
  end

  def ==(code)
    @pegs == code.pegs
  end
end
