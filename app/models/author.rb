# frozen_string_literal: true

# == Schema Information
#
# Table name: authors
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Author < ApplicationRecord
  has_one :talent, dependent: :destroy
  has_many :courses, dependent: :destroy

  validates :name, presence: true, length: { maximum: 255 }
end
