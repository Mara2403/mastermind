# frozen_string_literal: true

# Logic used to play the game
module GameLogic
  def exact_good(right_code, guess)
    exact_clues_array = []
    guess.each_with_index do |num, index|
      exact_clues_array << (right_code[index] == num ? 'x' : right_code[index])
    end
    exact_clues_array
    # show_clues(clues_array)
  end

  def good_guess_wrong_position_array(code, guess)
    good_guess_array = []

    guess.each_with_index do |num, index|
      good_guess_array << (code[index] == 'x' ? 'x' : num)
    end
    good_guess_array
  end

  def compare_codes(right_code, guess)
    temp_break_code = right_code.clone
    temp_code = exact_good(temp_break_code, guess)
    print temp_code # it shows original CODE to break array, with 'x' in place where the GUESS number is in exact good place

    # now remove those exact good guessed numbers from the user guess array
    # user guess array with x :
    work_array = good_guess_wrong_position_array(temp_code, guess)

    # the final comparing
    final_clue_array = []
    work_array.each_with_index do |num, index|
      if temp_code[index] == 'x'
        final_clue_array << 'x'
      elsif temp_code.include?(num)
        final_clue_array << 'o'
      end
      final_clue_array
    end
    print final_clue_array
    sorted_array = final_clue_array.sort { |a| a == 'x' ? -1 : 1 }
    show_clues(sorted_array)
  end
end
