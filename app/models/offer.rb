class Offer < ApplicationRecord
  belongs_to :user
  has_many :statistics, dependent: :destroy

  has_many :bookmarks, dependent: :destroy
  has_many :bookmarked_by_users, through: :bookmarks, source: :user

  enum :contract_type, { full_time: 0, part_time: 1, contract: 2, internship: 3, freelance: 4 }
  enum :job_type, { on_site: 0, remote: 1, hybrid: 2 }

  enum :status, { draft: 0, published: 1, paused: 2, expired: 3, archived: 4 }
  enum :verification_status, { unverified: 0, pending: 1, verified: 2, rejected: 3 }

  validates :company_name, :title, :address, :application_link, :contract_type, :job_type, presence: true
  after_validation :geocode, if: ->(obj) { obj.address_changed? }

  geocoded_by :address
  has_rich_text :description

  scope :views, -> { joins(:statistics).where(statistics: { stat_type: "view" }) }
  scope :applications, -> { joins(:statistics).where(statistics: { stat_type: "application" }) }
  scope :interactions, -> { joins(:statistics).where(statistics: { stat_type: "interaction" }) }

  private

  def self.ransackable_attributes(auth_object = nil)
    %w[ company_name title description job_type contract_type status verification_status ]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
