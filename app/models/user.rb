class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :exhibitions, dependent: :destroy
  has_many :works, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarks_exhibitions, through: :bookmarks, source: :exhibition
  

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :name, presence: true
  validates :email, uniqueness: true, presence: true

  def own?(object)
    id == object.user_id
  end

  def bookmark(exhibition)
    bookmarks_exhibitions << exhibition
  end

  def unbookmark(exhibition)
    bookmarks_exhibitions.destroy(exhibition)
  end

  def bookmark?(exhibition)
    bookmarks_exhibitions.include?(exhibition)
  end
end
