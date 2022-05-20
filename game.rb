require_relative "text_module.rb"
require "colorize"
require "pry"

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
    attr_reader :player1,:answer,:player2,:code_breaker,:master_code
    def initialize
        @player1=nil
        @player2= nil
        @code_breaker=nil
        @master_code=[]
        @turn= 0
        @answer = []
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
    @answer = gets.chomp.split("")
    if answer.any? { | x | x == "0"|| x == "7" || x == "8" || x == "9"}
        puts "Choose only between 1 & 6!"
        codebreaker_answer
    elsif answer.uniq!.length != 4
        puts "No duplicates please"
        codebreaker_answer
    else
      @answer.each do |str|
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

def clue_output
    @master_code.each_with_index do |m,i|
        @answer.each_with_index do |a,ix|
        if a == m && i == ix
        color_clues(0)
        elsif a == m && i!=ix
        color_clues(1)
        end
        end
    end
end

def winning
    @answer.eql?(@master_code)
end

def defeat 
    @turn== 12
end

def create_player
    whats_your_name
    name=gets.chomp
    player=Player.new(name)
end

def create_computer
    player=Player.new("Computer")
end

def victory_real
    if @player1.points == 3
        puts "Congratz! You have won the game"
    elsif @player2.points == 3
        puts "Computer has won the game! Best luck next time..."
    end
end


#compound methods

def point_distribution
    case points
    when winning && @code_breaker==@player1
        @player1.points += 1
        victory_text
    when defeat && @code_breaker == @player1
        @player2.points += 1
        defeat_text
    when defeat && @code_breaker == @player2
        @player1.points += 1
        defeat_text_computer
    when winning && @code_breaker==@player2
        @player2.points += 1
        victory_text_computer
    end
end

def human_codebreaker_turns
    until defeat do
        codebreaker_answer
        break if winning
    end
end

#def computer_codebreaker_turns
#end

def game_prep
    the_welcome_text
    rules_text
    colors_text
    choosing_role
end

def creating_players
    @player1=create_player
    @player2=create_computer
end

#computer as CodeBreaker
