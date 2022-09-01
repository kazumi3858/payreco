# frozen_string_literal: true

module Api
  module V1
    class CompaniesController < ApplicationController
      def index
        @companies = Company.where(:deleted_at: nil).order(updated_at: :DESC)

        render json: @companies
      end

      def create
        @company = Company.new(company_params)

        if @company.save
          render json: @company, status: :created, location: api_v1_company_url(@company)
        else
          render json: @company.errors, status: :unprocessable_entity
        end
      end

      def update
        set_company
        if @company.update(company_params)
          render json: @company
        else
          render json: @company.errors, status: :unprocessable_entity
        end
      end

      def destroy
        set_company
        @company.deleted_at = Time.now
        save!
      end

      private

      def set_company
        @company = Company.find(params[:id])
      end

      def company_params
        params.require(:company).permit(:name, :hourly, :wage, :currency)
      end
    end
  end
end
