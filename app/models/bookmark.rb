class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :exhibition

  validates :user_id, uniqueness: { scope: :exhibition_id }
end
