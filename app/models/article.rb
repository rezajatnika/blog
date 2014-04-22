class Article < ActiveRecord::Base
  # Title validations
  validates :title, presence: true
  validates :title, length: { minimum: 5, maximum: 25 }

  # Content validations
  validates :content, presence: true
end
