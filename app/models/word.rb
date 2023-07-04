class Word < ApplicationRecord
  validates :korean, :japanese, presence: true
end
