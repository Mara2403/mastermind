# frozen_string_literal: true

require_relative 'text_content'
require_relative 'display'
require_relative 'human_player'

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
  end

  def choose_mode
    mode = gets.chomp
    unless %w[1 2].include?(mode)
      puts ingame_text('warning_mode')
      return choose_mode
    end
    mode
  end

  def human_player
    HumanPlayer.new.play_game
  end

  def computer_player
    puts 'Computer Player'
  end
end
