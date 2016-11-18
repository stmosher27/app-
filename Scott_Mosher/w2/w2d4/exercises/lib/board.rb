class Board
    attr_reader :grid, :mark
    
    def initialize(grid = Array.new(3){Array.new(3)})
        @grid = grid
        @marks = [:X, :O]
    end
    
    def place_mark(pos, mark)
        self[pos] = mark
    end
    
    def [](pos)
        row, col = pos
        grid[row][col]
    end
    
    def []=(pos, value)
        row, col = pos
        grid[row][col] = value
    end

    def empty?(pos)
        if self[pos] == nil
            return true
        end
        false
    end
    
    def winner
        return rows if !rows.nil?
        return diags if !diags.nil?
        return cols if !cols.nil?
        nil
    end
    
    def rows
        arr = Array.new
        xArr = [:X,:X,:X]
        oArr = [:O,:O,:O]
        
        grid.each do |x,y,z|
            arr << x
            arr << y
            arr << z
            
            if (arr == xArr)
                return :X
            elsif (arr == oArr)
                return :O
            end
            arr.clear
        end
        
        nil
    end
    
    def cols
        arr = Array.new
        xArr = [:X,:X,:X]
        oArr = [:O,:O,:O]
        
        temp = grid.transpose
        
        temp.each do |x,y,z|
            arr << x
            arr << y
            arr << z
            
            if (arr == xArr)
                return :X
            elsif (arr == oArr)
                return :O
            end
            arr.clear
        end
        
        nil
    end
            
            
    
    def diags
        xArr = [:X,:X,:X]
        oArr = [:O,:O,:O]
        diags1 = Array.new
        diags2 = Array.new
        
        diags1 << grid[0][0] << grid[1][1] << grid[2][2]
        diags2 << grid[0][2] << grid[1][1] << grid[2][0]
        
        if diags1 == xArr || diags2 == xArr
            return :X
        elsif diags1 == oArr || diags2 == oArr
            return :O
        end

        nil
    end
            
    def over?
        if !winner.nil?
            return true
        end
        
        grid.flatten.none? do |pos|
            if pos.nil?
                return false
            end
        end
        
    end
    
end
