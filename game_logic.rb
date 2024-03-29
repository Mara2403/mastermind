# frozen_string_literal: true

# Logic used to play the game
module GameLogic
  def exact_good(code, guess)
    guess.each_with_index do |num, index|
      next unless code[index] == num

      guess[index] = 'x'
      code[index] = 'x'
    end
  end

  def good_guess_wrong_position(code, guess)
    guess.each_index do |index|
      next unless code[index] != 'x' && code.include?(guess[index])

      remove_with_this_index = code.find_index(guess[index]) # replacing it with 'o'
      code[remove_with_this_index] = 'o'
      guess[index] = 'o'
    end
  end

  def compare_codes(code, guess)
    temp_code = code.clone
    temp_guess = guess.clone

    exact_good(temp_code, temp_guess)
    good_guess_wrong_position(temp_code, temp_guess)

    sorted_array = temp_guess.sort { |a| a == 'x' ? -1 : 1 }
    print '  Clues: '
    show_clues(sorted_array)
  end

  def game_won?(code, guess)
    code == guess
  end

  def user_four_numbers
    user_guess = gets.chomp

    until user_guess == 'q' || user_guess.match?(/\A[1-6]{4}\z/)
      puts ingame_text('wrong_input')
      user_guess = gets.chomp
    end
    user_guess
  end

  def play_again?
    puts ingame_text('play_again')
    user_choice = gets.chomp
    until user_choice.match?(/^[yn]$/)
      puts ingame_text('y/n_only')
      user_choice = gets.chomp
    end
    user_choice
  end

  def choose_mode
    puts ingame_text('user_choice')
    mode = gets.chomp
    unless %w[1 2].include?(mode)
      puts ingame_text('warning_mode')
      return choose_mode
    end
    human_player if mode == '1'
    computer_player if mode == '2'
  end

  def human_player
    HumanPlayer.new.play_game
  end

  def computer_player
    ComputerPlayer.new.play_game
  end

  # methods for computer player:
  def feedback_matches_array(code, guess)
    temp_code = code.clone
    temp_guess = guess.clone

    exact_good(temp_code, temp_guess)
    good_guess_wrong_position(temp_code, temp_guess)

    return temp_guess
  end

  def use_feedback(possible_combinations, guess, feedback_array)
    exact_good = 0
    wrong_position = 0

    feedback_array.each do |item|
      exact_good += 1 if item == 'x'
      wrong_position += 1 if item == 'o'
    end

    # Filter possible combinations based on feedback
    filtered_combinations = possible_combinations.select do |possible_code|
      code_exact_good = 0
      code_wrong_position = 0

      # Calculate exact matches
      guess.each_with_index do |num, index|
        code_exact_good += 1 if num == possible_code[index]
      end
      # Calculate wrong position matches
      guess.each do |num|
        code_wrong_position += 1 if possible_code.include?(num)
      end
      # Don't count exact good as good but with wrong position
      code_wrong_position -= code_exact_good

      # Check if the counts match the feedback
      code_exact_good == exact_good && code_wrong_position == wrong_position
    end
    return filtered_combinations
  end
end
