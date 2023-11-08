def reverser(str, &prc)
    prc.call(str.reverse)
end

def word_changer(str, &prc)
    words = str.split(" ")
    new_words = words.map { |word| prc.call(word) }
    new_words.join(" ")
end

def greater_proc_value(num, prc_1, prc_2)
    result_1 = prc_1.call(num)
    result_2 = prc_2.call(num)
    result_1 > result_2 ? result_1 : result_2
end

def and_selector(arr, prc_1, prc_2)
    arr.select { |ele| prc_1.call(ele) && prc_2.call(ele) }
end

def alternating_mapper(arr, prc_1, prc_2)
    arr.map.with_index do |ele, i|
        if i.even?
            prc_1.call(ele)
        else
            prc_2.call(ele)
        end
    end
end
