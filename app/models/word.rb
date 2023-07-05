class Word < ApplicationRecord
  validates :korean, :japanese, presence: true
  belongs_to :user
end
