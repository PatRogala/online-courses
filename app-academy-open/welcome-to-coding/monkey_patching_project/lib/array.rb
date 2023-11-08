# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    if self.empty?
      return nil
    else
      self.max - self.min
    end
  end

  def average
    if self.empty?
      return nil
    else
      self.sum / (self.length * 1.0)
    end
  end

  def median
    if self.empty?
      return nil
    elsif self.length.odd?
      return self.sort[self.length / 2]
    else
      return (self.sort[self.length / 2] + self.sort[(self.length / 2) - 1]) / 2.0
    end
  end

  def counts
    count = Hash.new(0)
    self.each { |ele| count[ele] += 1 }
    count
  end

  def my_count(value)
    count = 0
    self.each { |ele| count += 1 if ele == value }
    count
  end

  def my_index(value)
    self.each_with_index { |ele, i| return i if ele == value }
    nil
  end

  def my_uniq
    new_arr = []
    self.each { |ele| new_arr << ele if !new_arr.include?(ele) }
    new_arr
  end

  def my_transpose
    new_arr = []
    (0...self.length).each do |i|
      sub_arr = []
      (0...self.length).each do |j|
        sub_arr << self[j][i]
      end
      new_arr << sub_arr
    end
    new_arr
  end
end
