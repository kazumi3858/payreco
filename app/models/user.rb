# frozen_string_literal: true

class User < ApplicationRecord
  has_many :companies, dependent: :destroy
  has_many :works, dependent: :destroy
end
