class Project < ApplicationRecord
  has_one_attached :photo
  has_many :questions, dependent: :destroy

  validates :description, presence: true, length: { minimum: 10, maximum: 80 }
  validates :title, presence: true
  validates :longitude, presence: true
  validates :latitude, presence: true
  validates :progress, presence: true
end
