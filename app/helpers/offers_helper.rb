module OffersHelper
  def contract_type_colour(contract_type)
    { "full_time" => "green", "part_time" => "blue", "contract" => "orange", "internship" => "purple", "freelance" => "teal" }[contract_type] || "gray"
  end

  def job_type_colour(job_type)
    { "on_site" => "green", "remote" => "blue", "hybrid" => "purple" }[job_type] || "gray"
  end

  def badge_for(key, colour_method, checked = true, options = {})
    colour = checked == true ? send(colour_method, key.to_s) : "gray"

    content_tag(:span, key.to_s.humanize.titleize, class: "badge px-2 py-1 badge-pill bg-#{colour}-lt text-#{colour} #{options}")
  end
end
