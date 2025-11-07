module OffersHelper
  def status_options
    Offer.statuses.keys.reject { |s| s == "expired" }.map { |s| [ s.humanize, s ] }
  end

  def job_type_options
    Offer.job_types.keys.map { |jt| [ jt.humanize, jt ] }
  end

  def contract_type_options
    Offer.contract_types.keys.map { |ct| [ ct.humanize, ct ] }
  end
end
