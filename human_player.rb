# frozen_string_literal: true

require_relative 'display'
require_relative 'text_content'
require_relative 'game_logic'

# Creates version of the game for a human player as the code breaker
class HumanPlayer
  include TextContent
  include Display
  include GameLogic

  def initialize
    @code_to_break = 4.times.map{ rand(1..6) }
  end

  def play_game
    puts player_instructions
    puts "# Computer generated #{@code_to_break}" # to be removed later
    user_guess = gets.chomp.split('').map(&:to_i)
    print user_guess
    compare_codes(@code_to_break, user_guess)
  end

  def compare_codes(right_code, guess)
    if right_code == guess
      puts ingame_text('user_won')
    end
  end
end
