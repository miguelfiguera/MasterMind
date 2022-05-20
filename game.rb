require_relative "text_module.rb"
require "colorize"

# player creation
class Player 
    attr_reader :name,:points
    def initialize(name)
        @name=name
        @points= 0
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

def clue_output(answer)
end

def winning(answer)
    answer.eql?(@master_code)
end

def defeat 
    @turn== 12
end



#compound methods