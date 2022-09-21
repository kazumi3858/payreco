# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Work, type: :model do
  it 'has a valid work' do
    expect(build(:work)).to be_valid
  end
end
