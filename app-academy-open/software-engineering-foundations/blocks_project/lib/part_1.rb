def select_even_nums(arr)
  arr.select(&:even?)
end

def reject_puppies(arr)
  arr.reject do |dog|
    dog["age"] <= 2
  end
end

def count_positive_subarrays(arr)
  arr.count do |sub_arr|
    sub_arr.sum > 0
  end
end

def aba_translate(str)
  vowels = "aeiou"
  new_str = ""
  str.each_char do |char|
    if vowels.include?(char)
      new_str += char + "b" + char
    else
      new_str += char
    end
  end
  new_str
end

def aba_array(arr)
  arr.map do |word|
    aba_translate(word)
  end
end