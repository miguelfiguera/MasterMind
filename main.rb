require_relative 'game'
require_relative 'text_module'
require "pry"


def game
  game = Game.new
  game.game_prep
  game.creating_players
  binding.pry
  until game.victory_real do
   if game.code_breaker == game.player1
      game.computer_master_code
      game.human_codebreaker_turns
      game.point_distribution_human
      game.evaluation
      game.swap_status
      game.swap_to_mastermind_text
      game.reset_turns
    elsif game.code_breaker == game.player2
      game.human_master_code
      game.computer_codebreaker_turns
      game.computer_points_distribution
      game.evaluation
      game.swap_status
      game.swap_codebreaker_text
      game.reset_turns
    end
    break if game.defeat_real
  end
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