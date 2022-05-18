require_relative "text_module.rb"

# player creation
class Player 
    def initialize(name,rol)
        @name=name
        @rol=rol
    end
end

#board display and interaction

class Board 
    attr_reader :dot, :turn
    def initialize 
        @dot=[["o","o","o","o"],["o","o","o","o"],["o","o","o","o"],["o","o","o","o"],
        ["o","o","o","o"],["o","o","o","o"],["o","o","o","o"],["o","o","o","o"],
        ["o","o","o","o"],["o","o","o","o"],]
        @turn=0
    end

    def view
        puts <<-HEREDOC
        #{dot[0][0]}|#{dot[0][1]}|#{dot[0][2]}|#{dot[0][3]}|
        #{dot[1][0]}|#{dot[1][1]}|#{dot[1][2]}|#{dot[1][3]}|
        #{dot[2][0]}|#{dot[2][1]}|#{dot[2][2]}|#{dot[2][3]}|
        #{dot[3][0]}|#{dot[3][1]}|#{dot[3][2]}|#{dot[3][3]}|
        #{dot[4][0]}|#{dot[4][1]}|#{dot[4][2]}|#{dot[4][3]}|
        #{dot[5][0]}|#{dot[5][1]}|#{dot[5][2]}|#{dot[5][3]}|
        #{dot[6][0]}|#{dot[6][1]}|#{dot[6][2]}|#{dot[6][3]}|
        #{dot[7][0]}|#{dot[7][1]}|#{dot[7][2]}|#{dot[7][3]}|
        #{dot[8][0]}|#{dot[8][1]}|#{dot[8][2]}|#{dot[8][3]}|
        #{dot[9][0]}|#{dot[9][1]}|#{dot[9][2]}|#{dot[9][3]}|
        HEREDOC
    end

    def update
        input=gets.chomp.split("")
        dot[@turn].replace(array)
        @turn += 1
    end
end


#Game Mechanics