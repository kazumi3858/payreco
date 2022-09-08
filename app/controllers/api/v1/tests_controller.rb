# frozen_string_literal: true

module Api
  module V1
    class TestsController < ApplicationController
      def index
        render json: { test: 'hi' }
      end
    end
  end
end
