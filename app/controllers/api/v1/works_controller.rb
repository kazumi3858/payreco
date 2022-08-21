# frozen_string_literal: true

module Api
  module V1
    class WorksController < ApplicationController
      def index
        works = Work.all
        render json: works
      end
    end
  end
end
