# frozen_string_literal: true
class Tag < ApplicationRecord

  enum tag_type: [:industry, :expertise]
  validates :name, uniqueness: true
end
