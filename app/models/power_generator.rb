class PowerGenerator < ApplicationRecord
  include PgSearch::Model
  validates :name, :description, :image_url, :manufacturer, :price, :kwp, presence: true
  validates :height, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 40 }
  validates :width, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :lenght, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 200 }
  validates :weight, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 3000 }

  has_many :freight

  pg_search_scope :search_for, against: [:name, :description]

  enum structure_type: %i[
    metalico
    ceramico
    fibrocimento
    laje
    solo
    trapezoidal
  ]
end
