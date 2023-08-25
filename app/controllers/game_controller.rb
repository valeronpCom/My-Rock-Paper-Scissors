# frozen_string_literal: true

class GameController < ApplicationController
  def index; end

  def play
    @user_move = params[:move]
    @server_throw = ThrowGenerator.new.call
    @result = DetermineTheResult.new(@user_move, @server_throw).call

    redirect_to result_path(result: @result, user_move: @user_move, server_throw: @server_throw)
  end

  def result
    @user_move = params[:user_move]
    @server_throw = params[:server_throw]
    @result = params[:result]
  end
end
