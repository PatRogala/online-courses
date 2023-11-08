# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(number)
    (2..number).reverse_each do |factor|
        if number % factor == 0 && prime?(factor)
            return factor
        end
    end
end

def prime?(num)
    return false if num < 2

    (2...num).each do |factor|
        if num % factor == 0
            return false
        end
    end

    true
end

def unique_chars?(str)
    chars = Hash.new(0)
    str.each_char { |char| chars[char] += 1 }
    chars.values.none? { |val| val > 1 }
end

def dupe_indices(array)
    indices = Hash.new { |h, k| h[k] = [] }
    array.each_with_index { |ele, i| indices[ele] << i }
    indices.select { |k, v| v.length > 1 }
end

def ana_array(arr_1, arr_2)
    count_1 = Hash.new(0)
    count_2 = Hash.new(0)

    arr_1.each { |ele| count_1[ele] += 1 }
    arr_2.each { |ele| count_2[ele] += 1 }

    count_1 == count_2
end