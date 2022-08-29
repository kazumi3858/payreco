# frozen_string_literal: true

Work.destroy_all
Company.destroy_all
User.destroy_all

User.create!(
  uid: 'Cu6un7yKom6t87v6Yi6uttVH2ctk',
  name: '田中 もくひょう無し郎',
  target_amount: nil
)

User.create!(
  uid: 'a7Cg274i8Rz5ecc6GsxqMS3sphzt',
  name: '山本 もくひょうアリ子',
  target_amount: 200000
)

User.first.companies.create!(
  name: 'ジキュウワーク',
  hourly_wage_system: true,
  wage_amount: 10,
  currency_type: '米ドル'
)

User.first.companies.create!(
  name: '株式会社ニッキュウ',
  hourly_wage_system: false,
  wage_amount: nil,
  currency_type: '円'
)

User.first.companies.create!(
  name: 'Abc company',
  hourly_wage_system: true,
  wage_amount: 10,
  currency_type: 'カナダドル'
)

# rubocop:disable Metrics/BlockLength
Company.all.each do |company|
  if company.hourly_wage_system
    company.works.create!(
      date: Date.new(2022, 8, 17),
      starting_time: Time.zone.local(2022, 8, 17, 10, 0),
      ending_time: Time.zone.local(2022, 8, 17, 17, 0),
      break_time: 60,
      working_hours: 6.0,
      pay_amount: 60,
      memo: '打ち合わせあり',
      user_id: company.user_id
    )

    company.works.create!(
      date: Date.new(2022, 9, 20),
      starting_time: Time.zone.local(2022, 9, 20, 6, 0),
      ending_time: Time.zone.local(2022, 9, 20, 12, 0),
      break_time: 45,
      working_hours: 5.25,
      pay_amount: 52,
      memo: 'ミーティング有り',
      user_id: company.user_id
    )
  else
    company.works.create!(
      date: Date.new(2022, 8, 9),
      starting_time: nil,
      ending_time: nil,
      break_time: nil,
      working_hours: 8.0,
      pay_amount: 15000,
      memo: nil,
      user_id: company.user_id
    )
  end
end
# rubocop:enable Metrics/BlockLength

ExchangeRate.delete_all

ExchangeRate.create!(
  year_and_month: 202208,
  # rubocop:disable Lint/SymbolConversion
  exchange_rate_list: { '円': 1, '米ドル': 0.007416, 'ユーロ': 0.007282, '英ポンド': 0.006149,
                        'インドルピー': 0.5887, '豪ドル': 0.01075, 'カナダドル': 0.009609, 'ランド': 0.1240,
                        'NZドル': 0.01187, 'SGドル': 0.01022, '人民元': 0.05024, 'スイスフラン': 0.007126 }
  # rubocop:enable Lint/SymbolConversion
)
