require_relative 'game'
require_relative 'text_module'

def game
  game = Game.new
  game.game_prep
  #this master code crap should be with a conditional "If player is codebreaker"
  game.computer_master_code
  game.creating_players
  game.human_codebreaker_turns
  game.victory_real
  repeat
end

def repeat
  puts 'Do you want to play again? Y/N'
  answer = gets.chomp.downcase
  if answer == 'y'
    game
  elsif answer != 'y' && answer != 'n'
    puts 'I did not understand...'
    repeat
  else
    puts 'Thanks for playing!'
  end
end

game