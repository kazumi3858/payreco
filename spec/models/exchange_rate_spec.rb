# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ExchangeRate, type: :model do
  it 'has a valid exchange rate' do
    expect(build(:exchange_rate)).to be_valid
  end

  it 'can form api data' do
    exchange_rate_api_stub
    expect(described_class.data).to eq({ 'NZドル' => 0.01173, 'SGドル' => 0.009833, 'インドルピー' => 0.01978,
                                         'カナダドル' => 6.4284, 'スイスフラン' => 0.006737, 'ユーロ' => 0.01249,
                                         'ランド' => 0.1235, '人民元' => 0.04887, '円' => 2, '米ドル' => 0.00698,
                                         '英ポンド' => 0.006114, '豪ドル' => 0.01041 })
  end
end
