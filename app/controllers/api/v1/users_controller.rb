# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      def create
        render json: { status: 'Successfully logged in' }
      end

      def destroy
        @current_user = nil
      end
    end
  end
end
