module BadgesHelper
  def badge_for(badge_type, key, checked = true, options = {})
    colour = checked == true ? send(badge_type, key) : "gray"

    content_tag(:span, key.humanize.titleize, class: "badge badge-sm px-2 py-1 bg-#{colour}-lt text-#{colour} border border-#{colour} #{options}")
  end

  def verification_status(status)
    colours = { "pending" => "yellow", "verified" => "green", "rejected" => "red" }
    colours[status] || "gray"
  end

  def status(status)
    colours = { "draft" => "gray", "published" => "green", "paused" => "yellow", "expired" => "red", "archived" => "blue" }
    colours[status] || "gray"
  end

  def contract_type(contract_type)
    colours = { "full_time" => "green", "part_time" => "blue", "contract" => "orange", "internship" => "purple", "freelance" => "teal" }
    colours[contract_type] || "gray"
  end

  def job_type(job_type)
    colours = { "on_site" => "green", "remote" => "blue", "hybrid" => "purple" }
    colours[job_type] || "gray"
  end
end
