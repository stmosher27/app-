class Dictionary
  # TODO: your code goes here!
  def initialize(hash={})
        @hash = hash
    end
    
    def entries()
        return @hash
    end
    
    def keywords
        return @hash.keys.sort!
    end
    
    def add(hash)
        if (hash.class == String)
            @hash[hash] = nil
        else
            hash.each do |key, val|
                @hash[key] = val
            end
        end
    end
    
    def include?(key)
        if (@hash.has_key?(key))
            return true
        else
            return false
        end
    end
    
    def find(key)
        return @hash.select{|k,v|  k.include?(key)}
    end
    
    def printable
        ans = []
        hash = @hash.sort
        hash.each do |k, v|
            ans <<"[" + k + "] " + "\"" + v + "\""
        end
        return ans.join("\n")
    end
    
end

