class Temperature
  # TODO: your code goes here!
    def in_fahrenheit
        if (@cel != nil)
            @fahr = @cel * (9.0/5.0) + 32
        end
        @fahr
    end
    
    def in_celsius
        if (@fahr != nil)
            @cel = (@fahr - 32) * (5.0/9.0)
        end
        @cel
    end
    
    def self.from_fahrenheit(temp)
        return self.new({:f => temp})
    end
    
    def self.from_celsius(temp)
        return self.new({:c => temp})
    end
    
    def initialize (hash)
        hash.each do |key, val|
            if (key.to_s == "f")
                @fahr = hash[key]
            end
            if (key.to_s == "c")
                @cel = hash[key]
            end
        end
    end
    
    def celsius=(temp)
        @cel = temp
    end
    
    def fahrenheit=(temp)
        @fahr = temp
    end

        
end

class Celsius < Temperature
    def initialize(temp)
        self.celsius = temp
    end
end

class Fahrenheit < Temperature
    def initialize(temp)
        self.fahrenheit = temp
    end
end


