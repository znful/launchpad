class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :offers, dependent: :destroy

  has_many :bookmarks, dependent: :destroy
  has_many :bookmarked_offers, through: :bookmarks, source: :offer

  def bookmark(offer)
    bookmarked_offers << offer unless bookmarked?(offer)
  end

  def unbookmark(offer)
    bookmarked_offers.delete(offer) if bookmarked?(offer)
  end

  def bookmarked?(offer)
    bookmarked_offers.include?(offer)
  end


  normalizes :email_address, with: ->(e) { e.strip.downcase }

  def display_name
    email_address.split("@").first.titleize
  end
end
