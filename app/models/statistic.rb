class Statistic < ApplicationRecord
  belongs_to :offer
  enum :stat_type, { view: 0, interaction: 1, application: 2 }
end
