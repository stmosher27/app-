def echo(str)
    str
end

def shout(str)
    str.upcase
end

def repeat(str, times = 2)
    ((str + " ") * times).strip
end

def start_of_word(str, num = 1)
    str[0,num]
end

def first_word(str)
    arr = str.split(" ")
    arr[0]
end

def titleize(str)
    smallWord = ["the", "of", "as", "if", "at", "and", "over"]
    arr = str.split(" ")
    arr[0].capitalize!
    for i in 1..arr.length-1
        if (!smallWord.include?(arr[i]))
            arr[i].capitalize!
        end
    end
    arr.join(" ")
end
    
    