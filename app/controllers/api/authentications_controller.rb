# frozen_string_literal: true

module Api
  module V1
    class AuthenticationsController < ApplicationController
      def destroy
        @current_user.destroy
      end
    end
  end
end
