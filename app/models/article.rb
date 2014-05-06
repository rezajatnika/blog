class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :user

  # Title validations
  validates :title, presence: true
  validates :title, length: { minimum: 5, maximum: 25 }

  # Content validations
  validates :content, presence: true
end
