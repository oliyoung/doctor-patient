class Note < ApplicationRecord
  belongs_to :appointment

  validates :body, presence: true
end
