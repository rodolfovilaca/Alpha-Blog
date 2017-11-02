class Article < ActiveRecord::Base
  #pelo migration se setar attr_accessor :title,:description vai dar override nos getters e setters já feitos e o save no banco não ira funcionar
  has_many :articles_categories
  has_many :categories, through: :articles_categories
  belongs_to :user
  validates :title, presence: true, length: {minimum: 3, maximum: 50}
  validates :descriptions, presence: true, length: {minimum: 5, maximum: 500}
  validates :user_id, presence: true
end
