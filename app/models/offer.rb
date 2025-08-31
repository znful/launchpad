class Offer < ApplicationRecord
  belongs_to :user

  enum :contract_type, { full_time: 0, part_time: 1, contract: 2, internship: 3, temporary: 4, freelance: 5 }
  enum :job_type, { onsite: 0, remote: 1, hybrid: 2 }

  validates :company_name, :title, :description, :country, :apply_link, :contract_type, :job_type, presence: true
  after_validation :geocode, if: ->(obj) { obj.country_changed? || obj.city_changed? }

  geocoded_by :address
  has_rich_text :description

  private

  def address
    [ city, country ].compact.join(", ")
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[ company_name description job_type title city country contract_type ]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[]
  end
end
