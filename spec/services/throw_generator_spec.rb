# frozen_string_literal: true

require 'rails_helper'

describe ThrowGenerator do
  describe '#call' do
    context 'when the API returns a valid response' do
      it 'returns the server throw from the API response' do
        api_response = { 'body' => 'rock' }
        http_response = double(body: api_response.to_json, code: '200')
        allow(Net::HTTP).to receive(:get_response).and_return(http_response)

        throw_generator = ThrowGenerator.new
        result = throw_generator.call

        expect(result).to eq('rock')
      end
    end

    context 'when the API returns an invalid response' do
      it 'generates a local throw' do
        allow(Net::HTTP).to receive(:get_response).and_return(Net::HTTPInternalServerError.new(nil, nil, nil))

        throw_generator = ThrowGenerator.new
        result = throw_generator.call

        expect(ThrowGenerator::THROW_OPTIONS).to include(result)
      end
    end

    context 'when an error occurs during API request' do
      it 'generates a local throw' do
        allow(Net::HTTP).to receive(:get_response).and_raise(StandardError)

        throw_generator = ThrowGenerator.new
        result = throw_generator.call

        expect(ThrowGenerator::THROW_OPTIONS).to include(result)
      end
    end
  end
end
