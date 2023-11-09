def palindrome?(str)
  str.each_char.with_index do |char, i|
    return false if char != str[-i - 1]
  end
  true
end

def substrings(str)
  subs = []
  (0...str.length).each do |start_idx|
    (start_idx...str.length).each do |end_idx|
      subs << str[start_idx..end_idx]
    end
  end
  subs
end

def palindrome_substrings(str)
  substrings(str).select { |substr| palindrome?(substr) && substr.length > 1 }
end