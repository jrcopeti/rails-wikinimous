class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 2 }
  validates :subtitle, presence: true, length: { in: 5..100 }
  validates :content, presence: true, length: { in: 10..500 }
end
