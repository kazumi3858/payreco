# frozen_string_literal: true

module Api
  module V1
    class AuthenticationsController < ApplicationController
      def destroy
        User.find(params[:id]).works.destroy_all
        User.find(params[:id]).destroy
      end
    end
  end
end
