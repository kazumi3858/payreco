# frozen_string_literal: true

module Api
  module V1
    class AuthenticationsController < ApplicationController
      def destroy
        p 'before destory'
        @current_user.destroy
        p 'after destroy'
      end
    end
  end
end
