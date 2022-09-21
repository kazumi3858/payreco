# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid user' do
    expect(build(:user)).to be_valid
  end
end
