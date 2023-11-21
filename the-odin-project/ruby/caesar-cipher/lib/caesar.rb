class Caesar
  CHAR_RANGE = 26

  def caesar_cipher(text, key)
    text.chars.map do |char|
      if char =~ /[a-zA-Z]/
        shift_char(char, key)
      else
        char
      end
    end.join
  end

  private

  def shift_char(char, key)
    if char == char.upcase
      shift_uppercase_char(char, key)
    else
      shift_lowercase_char(char, key)
    end
  end

  def shift_uppercase_char(char, key)
    ((char.ord - "A".ord + key) % CHAR_RANGE + "A".ord).chr
  end

  def shift_lowercase_char(char, key)
    ((char.ord - "a".ord + key) % CHAR_RANGE + "a".ord).chr
  end
end
