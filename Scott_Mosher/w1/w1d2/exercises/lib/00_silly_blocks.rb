def reverser (&prc)
    answer = prc.call
    arr = answer.split(' ')
    ansArr = []
    for i in 0.. arr.length-1
        ansArr << arr[i].reverse
    end
    ansArr.join(' ')
end

def adder(x = 1, &prc)
    num = prc.call
    num + x
end

def repeater(x = 1)
    x.times { yield }
end
    