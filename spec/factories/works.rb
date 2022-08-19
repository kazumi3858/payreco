# frozen_string_literal: true

FactoryBot.define do
  factory :work do
    starting_time { Time.zone.local(2022, 8, 17, 10, 0) }
    ending_time { Time.zone.local(2022, 8, 17, 17, 0) }
    break_time { 60 }
    working_hours { 6.0 }
    pay_amount { 60 }
    memo { 'メモです' }
    user { company.owner }
    company
  end
end
