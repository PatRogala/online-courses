def partition(arr, n)
  left = []
  right = []
  arr.each do |ele|
    if ele < n
      left << ele
    else
      right << ele
    end
  end
  [left, right]
end

def merge(hash_1, hash_2)
  new_hash = {}
  hash_1.each { |k, v| new_hash[k] = v }
  hash_2.each { |k, v| new_hash[k] = v }
  new_hash
end

def censor(sentence, banned)
  words = sentence.split(" ")
  new_words = words.map do |word|
    if banned.include?(word.downcase)
      star_vowels(word)
    else
      word
    end
  end
  new_words.join(" ")
end

def star_vowels(word)
  vowels = "aeiou"
  new_word = ""
  word.each_char do |char|
    if vowels.include?(char.downcase)
      new_word += "*"
    else
      new_word += char
    end
  end
  new_word
end

def power_of_two?(num)
  product = 1
  while product < num
    product *= 2
  end
  product == num
end