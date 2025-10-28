class Statistic < ApplicationRecord
  belongs_to :offer
  enum :stat_type, { view: 0, click: 1, application: 2 }
end
