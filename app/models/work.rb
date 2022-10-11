# frozen_string_literal: true

class Work < ApplicationRecord
  belongs_to :user
  belongs_to :company, touch: true
  validates :date, presence: true
  validates :pay_amount, presence: true, numericality: { in: 0..999999 }
  validates :working_hours, presence: true, numericality: { in: 0.01..47.99 }
  validates :memo, length: { allow_nil: true, in: 0..50 }
end
