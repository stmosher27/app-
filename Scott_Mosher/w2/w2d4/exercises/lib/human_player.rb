class HumanPlayer
    attr_reader :name, :mark
    attr_writer :mark
    
    def initialize(name)
        @name = name
    end
    
    def display(board)
        row0 = "0 |"
        (0..2).each do |col|
            row0 << (board.empty?([0, col]) ? "   |" : " " + board[[0, col]].to_s + " |")
        end
        row1 = "1 |"
        (0..2).each do |col|
            row1 << (board.empty?([1, col]) ? "   |" : " " + board[[1, col]].to_s + " |")
        end
        row2 = "2 |"
        (0..2).each do |col|
            row2 << (board.empty?([2, col]) ? "   |" : " " + board[[2, col]].to_s + " |")
        end
        
        puts row0
        puts row1
        puts row2
    end
    
    def get_move
        puts "Where will you go? (row, col)"
        arr = gets.chomp.split(",")
        arr.map(&:to_i)
    end
end
