class RPNCalculator
  # TODO: your code goes here!
  def initialize
        @arr = []
        @value = 0
    end
    
    def value
        @value
    end
      
    def push(int)
        @arr << int
    end
      
    def plus
        size_error
        num1 = @arr.pop
        num2 = @arr.pop
        @value = num1 + num2
        @arr << @value
    end
    
    def minus
        size_error
        num1 = @arr.pop
        num2 = @arr.pop
        @value = num2 - num1
        @arr << @value
    end
    
    def divide
        size_error
        num1 = @arr.pop.to_f
        num2 = @arr.pop.to_f
        @value = num2 / num1
        @arr << @value
    end
    
    def times
        size_error
        num1 = @arr.pop
        num2 = @arr.pop
        @value = num1 * num2
        @arr << @value
    end

    def size_error
        if (@arr.size < 2)
            raise "calculator is empty"
        end
    end
    
    def tokens(str)
        str.delete!(' ')
        ans = []
        for i in 0..str.length-1
            if (str[i].match /\D/ )
                ans << str[i].to_sym
            else
                ans << str[i].to_i
            end
        end
        return ans
    end
    
    def evaluate(str)
        arr = str.split(' ')
        for i in 0..arr.length-1
            if (arr[i].match (/\d/))
                push(arr[i].to_i)
            end
            if (arr[i] == "+")
                plus
            elsif (arr[i] == "-")
                minus
            elsif (arr[i] == "*")
                times
            elsif (arr[i] == "/")
                divide
            end
        end
        value
    end

end
