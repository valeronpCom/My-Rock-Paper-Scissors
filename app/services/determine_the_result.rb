# frozen_string_literal: true

class DetermineTheResult
  WINNING_COMBINATIONS = {
    'rock' => 'scissors',
    'scissors' => 'paper',
    'paper' => 'rock'
  }.freeze

  def initialize(user_move, server_throw)
    @user_move = user_move
    @server_throw = server_throw
  end

  def call
    if !Constants::VALID_MOVES.include?(user_move)
      'Invalid move. Please choose rock, paper or scissors.'
    elsif user_move == server_throw
      'It\'s a tie!'
    elsif WINNING_COMBINATIONS[user_move] == server_throw
      'You win!'
    else
      'You lose!'
    end
  end

  private

  attr_reader :user_move, :server_throw
end
