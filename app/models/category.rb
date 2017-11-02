class Category < ActiveRecord::Base
  has_many :articles_categories
  has_many :articles, through: :articles_categories
  validates :name, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 3, maximum: 25}
end
