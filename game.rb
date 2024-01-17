# frozen_string_literal: true

require_relative 'text_content'
require_relative 'display'

# Provides game logic
class Game
  include TextContent
  include Display

  def play
    puts game_intro
    puts ingame_text('user_choice')
    mode = choose_mode
    human_player if mode == '1'
    computer_player if mode == '2'
    # show_code([1,2,3,4,5,6])
    # show_clues(%w[x x o o])
  end

  def choose_mode
    mode = gets.chomp
    unless %w[1 2].include?(mode)
      puts ingame_text('warning_mode')
      choose_mode
    end
    mode
  end

  def human_player
    puts 'Human Player'
  end

  def computer_player
    puts 'Computer Player'
  end
end
