class Task < ApplicationRecord
  belongs_to :list
  validates :name, presence: true
  validates :status, presence: true
end
