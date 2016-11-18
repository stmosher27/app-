def translate(str)
    arr = str.split(" ")
    answer = []
    for i in 0..arr.length-1
        answer << first_letter?(arr[i])
    end
    return answer.join(" ")
end

def first_letter?(str)
    vowelArray = ["a", "e", "i", "o", "u"]
    if (vowelArray.include?(str[0]))
        vowel_start(str)
    else
        consonant_start(str)
    end
end
    

def vowel_start(str)
    str + "ay"
end

def consonant_start(str)
    answer = ""
    vowelArray = ["a", "e", "i", "o", "u"]
    for i in 0..str.length-1
        if (vowelArray.include?(str[i]))
            return answer = str[i,str.length-i] + str[0, i] + "ay"
        elsif (str[i] == "q" && str[i+1] == "u")
            return answer = str[i+2,str.length-(i+2)] + str[0,i+2] +"ay"
        end
    end
end
        