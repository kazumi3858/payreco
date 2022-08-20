# frozen_string_literal: true

FactoryBot.define do
  factory :exchange_rate do
    year_and_month { 202208 }
    exchange_rate_list do
      { '円': 1, '米ドル': 0.007416, 'ユーロ': 0.007282, '英ポンド': 0.006149, 'インドルピー': 0.5887, '豪ドル': 0.01075, 'カナダドル': 0.009609,
        'ランド': 0.1240, NZドル: 0.01187, SGドル: 0.01022, '人民元': 0.05024, 'スイスフラン': 0.007126 }
    end
  end
end
