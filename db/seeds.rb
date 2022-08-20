# frozen_string_literal: true

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

Company.destroy_all

User.all.each do |user|
  user.companies.create!(
    name: 'ジキュウCompany US',
    hourly_wage_system: true,
    wage_amount: 10,
    currency_type: '米ドル'
  )
  user.companies.create!(
    name: '株式会社ニッキュウ',
    hourly_wage_system: false,
    wage_amount: nil,
    currency_type: '円'
  )
end

Work.destroy_all

Company.all.each do |company|
  if company.hourly_wage_system
    company.works.create!(
      starting_time: Time.zone.local(2022, 8, 17, 10, 0),
      ending_time: Time.zone.local(2022, 8, 17, 17, 0),
      break_time: 60,
      working_hours: 6.0,
      pay_amount: 60,
      memo: 'メモです',
      user_id: company.user_id
    )
  else
    company.works.create!(
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
