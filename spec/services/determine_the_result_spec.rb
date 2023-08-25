# frozen_string_literal: true

require 'rails_helper'

describe DetermineTheResult do
  describe '#call' do
    context 'with valid moves' do
      it 'returns the correct result for a win' do
        result = DetermineTheResult.new('rock', 'scissors').call
        expect(result).to eq('You win!')
      end

      it 'returns the correct result for a loss' do
        result = DetermineTheResult.new('paper', 'scissors').call
        expect(result).to eq('You lose!')
      end

      it 'returns the correct result for a tie' do
        result = DetermineTheResult.new('rock', 'rock').call
        expect(result).to eq('It\'s a tie!')
      end
    end

    context 'with an invalid move' do
      it 'returns an error message' do
        result = DetermineTheResult.new('invalid', 'rock').call
        expect(result).to eq('Invalid move. Please choose rock, paper or scissors.')
      end
    end
  end
end
