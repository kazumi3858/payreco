# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      def create
        render json: { status: 'Successfully logged in' }
      end
    end
  end
end
