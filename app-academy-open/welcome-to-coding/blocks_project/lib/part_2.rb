def all_words_capitalized?(words)
    words.all? { |word| word == word.capitalize }
end

def no_valid_url?(urls)
    valid_endings = ['.com', '.net', '.io', '.org']
    urls.none? do |url|
        valid_endings.any? { |ending| url.end_with?(ending) }
    end
end

def any_passing_students?(students)
    students.any? do |student|
        avg = student[:grades].sum / student[:grades].length
        avg >= 75
    end
end
