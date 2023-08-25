# frozen_string_literal: true

require 'net/http'
require 'json'

class ThrowGenerator
  THROW_OPTIONS = %w[rock paper scissors].freeze

  def initialize(api_url = 'https://5eddt4q9dk.execute-api.us-east-1.amazonaws.com/rps-stage/throw')
    @api_url = api_url
  end

  def call
    response_body = fetch_response_body
    response_throw = response_body['body'] if response_body.is_a?(Hash)
    response_throw || generate_local_throw
  rescue StandardError
    generate_local_throw
  end

  private

  attr_reader :api_url

  def fetch_response_body
    response = Net::HTTP.get_response(URI(api_url))
    JSON.parse(response.body) if response.code == '200'
  end

  def generate_local_throw
    THROW_OPTIONS.sample
  end
end
