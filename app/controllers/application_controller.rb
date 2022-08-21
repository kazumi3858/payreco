# frozen_string_literal: true

class ApplicationController < ActionController::API
  # include ActionController::HttpAuthentication::Token::ControllerMethods
  # before_action :authenticate

  # class AuthenticationError < StandardError; end
  # rescue_from AuthenticationError, with: :not_authenticated

  # def authenticate
  #   authenticate_with_http_token do |token, _options|
  #     decoded_token = FirebaseAuth::Auth.verify_id_token(token)
  #     raise AuthenticationError unless current_user(decoded_token)
  #   end
  # end

  # def current_user(token)
  #   if User.find_by(uid: token['uid'])
  #     @current_user ||= User.find_by(uid: token['uid'])
  #   else
  #     @current_user = User.create!(uid: token['uid'], name: token['decoded_token'][:payload]['name'])
  #   end
  # end

  # private

  # def not_authenticated
  #   render json: { error: { messages: ['ログインしてください'] } }, status: :unauthorized
  # end
end
