module DashboardHelper
  def verification_status_badge(status)
    colours = { "pending" => "yellow", "verified" => "green", "rejected" => "red" }
    colour = colours[status] || "gray"

    content_tag(:span, status.humanize.titleize, class: "badge badge-sm px-2 py-1 bg-#{colour}-lt text-#{colour} border border-#{colour} ms-auto")
  end

  def status_badge(status)
    colours = { "draft" => "gray", "published" => "green", "paused" => "yellow", "expired" => "red", "archived" => "blue" }
    colour = colours[status] || "gray"

    content_tag(:span, status.humanize.titleize, class: "badge badge-sm px-2 py-1 bg-#{colour}-lt text-#{colour} border border-#{colour} ms-auto")
  end
end
