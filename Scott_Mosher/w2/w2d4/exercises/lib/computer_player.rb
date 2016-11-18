class ComputerPlayer
    attr_reader :name, :board, :mark
    attr_writer :mark
    
    def initialize(name)
        @name = name
    end
    
    def display(board)
        @board = board
    end
    
    def get_move
        moves = []
        size_arr = [0,1,2]
        size_arr.each do |row|
            size_arr.each do |col|
                if board[[row, col]] == nil
                    moves << [row,col]
                end
            end
        end
        
        moves.each do |mov|
            board[mov] = mark
            if board.winner == mark
                return mov
            end
            board[mov] = nil
        end
        
        moves.sample
    end
    
    
end
