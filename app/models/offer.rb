class Offer < ApplicationRecord
  belongs_to :user
  has_rich_text :description

  after_validation :geocode, if: ->(obj) { obj.country_changed? || obj.city_changed? }

  validates :company_name, :title, :description, :country, :apply_link, :contract_type, :job_type, presence: true


  enum contract_type: { full_time: 0, part_time: 1, contract: 2, internship: 3, temporary: 4, freelance: 5 }
  enum job_type: { onsite: 0, remote: 1, hybrid: 2 }
end
