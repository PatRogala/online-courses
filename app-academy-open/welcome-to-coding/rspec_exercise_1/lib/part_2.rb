def hipsterfy(word)
  vowels = "aeiou"
  i = word.length - 1
  while i >= 0
    if vowels.include?(word[i])
      word[i] = ""
      return word
    end
    i -= 1
  end
  word
end

def vowel_counts(str)
  vowels = "aeiou"
  hash = Hash.new(0)
  str.downcase.each_char do |char|
    if vowels.include?(char)
      hash[char] += 1
    end
  end
  hash
end

def caesar_cipher(message, n)
  alphabet = "abcdefghijklmnopqrstuvwxyz"
  new_message = ""
  message.each_char do |char|
    if alphabet.include?(char)
      old_idx = alphabet.index(char)
      new_idx = old_idx + n
      new_char = alphabet[new_idx % 26]
      new_message += new_char
    else
      new_message += char
    end
  end
  new_message
end