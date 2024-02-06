# frozen_string_literal: true

require_relative 'display'
require_relative 'text_content'
require_relative 'game_logic'

# Creates version of the game for a computer as the code breaker
class ComputerPlayer
  include TextContent
  include Display
  include GameLogic

  def initialize
    puts computer_game_instructions
    @code_to_break = user_four_numbers
    @possible_combinations = (1..6).to_a.repeated_permutation(4).to_a
    @guessed_combinations = []
  end

  def play_game
    puts "User code to crack by the computer: #{@code_to_break}"

    12.times do |turn|
      random_guess = @possible_combinations.sample
      puts "Turn #{turn + 1}. Computer guess: #{random_guess}"
      if game_won?(@code_to_break, random_guess)
        puts ingame_text('computer_won')
        user_choice = play_again?
        choose_mode if user_choice == 'y'
        puts ingame_text('break') if user_choice == 'n'
        break
      end
    end
  end
end
