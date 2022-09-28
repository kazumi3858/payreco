# frozen_string_literal: true

class User < ApplicationRecord
  has_many :companies, dependent: :destroy
  has_many :works, dependent: :destroy
  validates :uid, presence: true
  validates :name, presence: true
  validates :target_amount, numericality: { in: 1..9999999 }
end
