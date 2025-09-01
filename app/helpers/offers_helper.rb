module OffersHelper
  def contract_type_colour(offer)
    {
      "full_time"  => "bg-green-100 text-green-600",
      "part_time"  => "bg-blue-100 text-blue-600",
      "contract"   => "bg-purple-100 text-purple-600",
      "internship" => "bg-yellow-100 text-yellow-600",
      "temporary"  => "bg-orange-100 text-orange-600",
      "freelance"  => "bg-red-100 text-red-600"
    }[offer] || "bg-gray-100 text-gray-600"
  end

  def contract_filter_colour(offer)
    {
      "full_time"  => "peer-checked:bg-green-100 peer-checked:text-green-600 peer-checked:border-green-600",
      "part_time"  => "peer-checked:bg-blue-100 peer-checked:text-blue-600 peer-checked:border-blue-600",
      "contract"   => "peer-checked:bg-purple-100 peer-checked:text-purple-600 peer-checked:border-purple-600",
      "internship" => "peer-checked:bg-yellow-100 peer-checked:text-yellow-600 peer-checked:border-yellow-600",
      "temporary"  => "peer-checked:bg-orange-100 peer-checked:text-orange-600 peer-checked:border-orange-600",
      "freelance"  => "peer-checked:bg-red-100 peer-checked:text-red-600 peer-checked:border-red-600"
    }[offer] || "peer-checked:bg-gray-100 peer-checked:text-gray-600 peer-checked:border-gray-600"
  end

  def job_type_colour(offer)
    {
      "onsite" => "bg-rose-100 text-rose-600",
      "remote" => "bg-fuchsia-100 text-fuchsia-600",
      "hybrid" => "bg-teal-100 text-teal-600"
    }[offer] || "bg-gray-100 text-gray-600"
  end

  def job_filter_colour(offer)
    {
      "onsite" => "peer-checked:bg-rose-100 peer-checked:text-rose-600 peer-checked:border-rose-600",
      "remote"  => "peer-checked:bg-fuchsia-100 peer-checked:text-fuchsia-600 peer-checked:border-fuchsia-600",
      "hybrid"  => "peer-checked:bg-teal-100 peer-checked:text-teal-600 peer-checked:border-teal-600"
    }[offer] || "peer-checked:bg-gray-100 peer-checked:text-gray-600 peer-checked:border-gray-600"
  end
end
