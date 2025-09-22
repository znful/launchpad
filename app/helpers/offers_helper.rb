module OffersHelper
  def contract_type_colour(contract_type)
    { "full_time" => "green", "part_time" => "blue", "contract" => "orange", "internship" => "purple", "freelance" => "teal" }[contract_type] || "gray"
  end

  def job_type_colour(job_type)
    { "on_site" => "green", "remote" => "blue", "hybrid" => "purple" }[job_type] || "gray"
  end
end
