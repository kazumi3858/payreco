# frozen_string_literal: true

FactoryBot.define do
  factory :user, aliases: [:owner] do
    sequence(:uid) { |n| "dummy_uid#{n}" }
    name { '田中 もくひょう無し郎' }
    target_amount { nil }
  end
end
