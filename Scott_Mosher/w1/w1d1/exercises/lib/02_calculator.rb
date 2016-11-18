def add(num1, num2)
    num1+num2
end

def subtract(num1, num2)
    num1-num2
end

def sum (arr)
    answer = 0
    arr.each do |num|
        answer += num
    end
    answer
end

def multiply (num1, num2)
    num1*num2
end

def power (num1, pow)
    num1**pow
end

def factorial (num)
    answer = 1
    if num == 1 || num == 0
        return 1
    end
    for i in 2..num
        answer *= i
    end
    return answer
end