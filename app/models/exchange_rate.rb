# frozen_string_literal: true

class ExchangeRate < ApplicationRecord
  def old_data?
    created_at < Time.zone.now.beginning_of_day
  end
end
