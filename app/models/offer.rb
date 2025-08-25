class Offer < ApplicationRecord
  has_rich_text :description
  geocoded_by :address
  after_validation :geocode, if: ->(obj) { obj.city_changed? || obj.country_changed? }

  validates :title, presence: true
  validates :description, presence: true
  validates :city, presence: true
  validates :country, presence: true

  private

  def address
    [ city, country ].compact.join(", ")
  end
end
