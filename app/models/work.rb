class Work < ApplicationRecord
  mount_uploader :work_image, WorkImageUploader

  belongs_to :user
  belongs_to :exhibition

  validates :work_image, presence: true
end
