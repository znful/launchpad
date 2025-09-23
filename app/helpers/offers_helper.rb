module OffersHelper
  def contract_type_colour(contract_type)
    { "full_time" => "green", "part_time" => "blue", "contract" => "orange", "internship" => "purple", "freelance" => "teal" }[contract_type] || "gray"
  end

  def job_type_colour(job_type)
    { "on_site" => "green", "remote" => "blue", "hybrid" => "purple" }[job_type] || "gray"
  end

  def contract_type_badge(key)
    colour = contract_type_colour(key.to_s)
    content_tag(:span, key.to_s.humanize.titleize, class: "badge px-2 py-1 badge-pill bg-#{colour}-lt text-#{colour}")
  end

  def job_type_badge(key)
    colour = job_type_colour(key.to_s)
    content_tag(:span, key.to_s.humanize.titleize, class: "badge px-2 py-1 badge-pill bg-#{colour}-lt text-#{colour}")
  end
end
