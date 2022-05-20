require_relative "text_module.rb"
require "colorize"

# player creation
class Player 
    attr_reader :name
    def initialize(name)
        @name=name
    end
end

#board display and interaction
#I think I do not need a board this time...
# just players, puts and turns...

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
class Game
    attr_reader :player1,:player2,:code_breaker,:master_code
    def initialize
        @player1=nil
        @player2= nil
        @code_breaker=nil
        @master_code=[]
        @turn= 0
    end

#basic methods

def random_number
    number=(rand*7).to_i
end

def computer_master_code
    @master_code = [] if @master_code.length == 4
    until @master_code.length == 4 do
        number = random_number
        @master_code.push(number.to_s) if number != 0
        @master_code.uniq!
    end
end

def codebreaker_answer
    the_turn_number_text(@turn)
    update_the_board_text
    answer = gets.chomp.split("")
    if answer.any? { | x | x == "0"|| x == "7" || x == "8" || x == "9"}
        puts "Choose only between 1 & 6!"
        codebreaker_answer
    elsif answer.uniq!.length != 4
        puts "No duplicates please"
        codebreaker_answer
    else
      answer.each do |str|
        printing_with_color(str)
      end
    turn_update
    end
end

def turn_update
    @turn: += 1
end
    
def choosing_role
    select_your_rol_text
    answer = gets.chomp.downcase
    if answer == "m"
        @code_breaker = @player2
    elsif answer == "c"
        @code_breaker = @player1
    end
end


#compound methods