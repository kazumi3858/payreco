# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :cors_set_access_control_headers
  before_action :authenticate

  class AuthenticationError < StandardError; end
  rescue_from AuthenticationError, with: :not_authenticated

  def authenticate
    authenticate_with_http_token do |token, _options|
      decoded_token = FirebaseAuth::Auth.verify_id_token(token)
      raise AuthenticationError unless current_user(decoded_token)
    end
  end

  def current_user(token)
    @current_user = User.find_or_initialize_by(uid: token['uid'], name: token['decoded_token'][:payload]['name'])
    @current_user.save!
  end

  def not_authenticated
    render json: { error: { messages: ['ログインしてください'] } }, status: :unauthorized
  end

  def cors_preflight_check
    return unless request.method == 'OPTIONS'

    cors_set_access_control_headers
    head :no_content
  end

  protected

  def cors_set_access_control_headers
    response.headers['Access-Control-Allow-Origin'] = 'https://payreco.fly.dev/, http://localhost:3001'
    response.headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, PATCH, DELETE, OPTIONS, HEAD'
    response.headers['Access-Control-Allow-Headers'] =
      'Origin, Content-Type, Accept, Authorization, Token, Auth-Token, X-XSRF-TOKEN'
    response.headers['Access-Control-Max-Age'] = '1728000'
    response.headers['Access-Control-Allow-Credentials'] =true
  end
end
