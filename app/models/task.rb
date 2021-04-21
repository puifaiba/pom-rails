class Task < ApplicationRecord
  belongs_to :column
  belongs_to :user

  validates :title, :column_id, presence: true
end
