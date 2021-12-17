# frozen_string_literal: true

class Article < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :has_categories
  has_many :categories, through: :has_categories

  validates :title, presence: true, uniqueness: true
  validates :body, presence: true, length: { minimum: 20 }

  before_create :set_visits_count
  after_create :save_categories

  def update_visits_count
    update(visits_count: visits_count + 1)
  end

  attr_writer :categories

  private

  def save_categories
    @categories.each do |category_id|
      HasCategory.create(category_id: category_id, article_id: id)
    end
  end

  def set_visits_count
    self.visits_count ||= 0
  end
end
