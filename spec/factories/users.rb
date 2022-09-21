# frozen_string_literal: true

FactoryBot.define do
  factory :user, aliases: [:owner] do
    sequence(:uid) { |n| "dummy_uid#{n}" }
    sequence(:name) { |n| "テストユーザー#{n}" }
    target_amount { nil }
  end
end
