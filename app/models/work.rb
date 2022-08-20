# frozen_string_literal: true

class Work < ApplicationRecord
  belongs_to :user
  belongs_to :company
end
