# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      def show
        render json: current_user
      end

      def update
        if current_user.update(user_params)
          render json: current_user
        else
          render json: current_user.errors, status: :unprocessable_entity
        end
      end

      def destroy
        current_user = nil # rubocop:disable Lint/UselessAssignment
        head :no_content
      end

      private

      def user_params
        params.require(:user).permit(:target_amount)
      end
    end
  end
end
