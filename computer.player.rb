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
    @possible_combinations = (1..6).to_a.repeated_permutation(4).to_a.map do |combination|
      combination.map(&:to_i)
    end
    @guessed_combinations = []
  end

  def play_game
    puts "User code to crack by the computer: #{@code_to_break}"
    break_code = @code_to_break.split('').map(&:to_i)
    12.times do |turn|
      random_guess = @possible_combinations.sample
      puts "Turn #{turn + 1}. Computer guess: #{random_guess}"
      if game_won?(break_code, random_guess)
        puts ingame_text('computer_won')
        user_choice = play_again?
        choose_mode if user_choice == 'y'
        puts ingame_text('break') if user_choice == 'n'
        break
      end
      compare_codes(break_code, random_guess)
      feedback_array = feedback_matches_array(break_code, random_guess)
      @possible_combinations = use_feedback(@possible_combinations, random_guess, feedback_array)
      puts "Updated possible combinations: #{@possible_combinations}"
    end
  end
end
