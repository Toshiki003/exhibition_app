class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :exhibitions, dependent: :destroy
  has_many :works, dependent: :destroy
  

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :name, presence: true
  validates :email, uniqueness: true, presence: true
end
