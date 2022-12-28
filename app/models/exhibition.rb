class Exhibition < ApplicationRecord
  belongs_to :user
  has_many :works, dependent: :destroy
end
