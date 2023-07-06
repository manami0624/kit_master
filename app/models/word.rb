class Word < ApplicationRecord
  validates :korean, :japanese, presence: true
  belongs_to :user

  def self.search(search)
    if search != ""
      Word.where(['korean LIKE ? OR japanese LIKE ?', "%#{search}%", "%#{search}%"])
    else
      Word.all
    end
  end
end
