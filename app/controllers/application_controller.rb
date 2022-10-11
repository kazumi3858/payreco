# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :authenticate
  attr_accessor :current_user

  def authenticate
    authenticate_with_http_token do |token, _options|
      decoded_token = FirebaseAuth::Auth.verify_id_token(token)
      find_current_user(decoded_token)
    end
  end

  private

  def find_current_user(token)
    @current_user = User.find_or_initialize_by(uid: token['uid'], name: token['decoded_token'][:payload]['name'])
    @current_user.save!
  end
end
