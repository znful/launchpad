class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :offer

  validates :user_id, uniqueness: { scope: :offer_id }
end
