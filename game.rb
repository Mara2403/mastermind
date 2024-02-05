# frozen_string_literal: true

require_relative 'text_content'
require_relative 'display'
require_relative 'human_player'
require_relative 'game_logic'

# Starts new game for the code maker or the breaker
class Game
  include TextContent
  include Display
  include GameLogic

  def play
    puts game_intro
    choose_mode
  end
end
