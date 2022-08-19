# frozen_string_literal: true

FactoryBot.define do
  factory :company do
    name { '株式会社ABCD' }
    hourly_wage_system { true }
    wage_amount { 10 }
    currency_type { '米ドル' }
    association :owner
  end
end
