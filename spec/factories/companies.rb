# frozen_string_literal: true

FactoryBot.define do
  factory :company do
    sequence(:name) { |n| "株式会社#{n}" }
    hourly_wage_system { true }
    wage_amount { 10 }
    currency_type { '米ドル' }
    association :owner
  end
end
