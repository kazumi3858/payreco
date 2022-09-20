# frozen_string_literal: true

FactoryBot.define do
  factory :work do
    sequence(:date) { |n| Date.new(2022, 8, n) }
    sequence(:starting_time) { |n| Time.zone.local(2022, 8, n, 10, 0) }
    sequence(:ending_time) { |n| Time.zone.local(2022, 8, n, 17, 0) }
    break_time { 60 }
    working_hours { 6.0 }
    pay_amount { 60 }
    memo { 'メモです' }
    user { company.owner }
    company
  end
end
