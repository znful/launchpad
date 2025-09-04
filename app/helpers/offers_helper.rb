module OffersHelper
  def contract_type_colour(offer)
    {
      "full_time"  => "bg-green-100 text-green-600 dark:bg-green-300 dark:text-green-700 dark:border-green-300",
      "part_time"  => "bg-blue-100 text-blue-600 dark:bg-blue-300 dark:text-blue-700 dark:border-blue-300",
      "contract"   => "bg-purple-100 text-purple-600 dark:bg-purple-300 dark:text-purple-700 dark:border-purple-300",
      "internship" => "bg-yellow-100 text-yellow-600 dark:bg-yellow-300 dark:text-yellow-700 dark:border-yellow-300",
      "temporary"  => "bg-orange-100 text-orange-600 dark:bg-orange-300 dark:text-orange-700 dark:border-orange-300",
      "freelance"  => "bg-red-100 text-red-600 dark:bg-red-300 dark:text-red-700 dark:border-red-300"
    }[offer] || "bg-gray-100 text-gray-600 dark:bg-gray-300 dark:text-gray-700 dark:border-gray-300"
  end

  def contract_filter_colour(offer)
    {
      "full_time"  => "peer-checked:bg-green-100 peer-checked:text-green-600 peer-checked:border-green-600 dark:peer-checked:bg-green-300 dark:peer-checked:text-green-700 dark:peer-checked:border-green-300",
      "part_time"  => "peer-checked:bg-blue-100 peer-checked:text-blue-600 peer-checked:border-blue-600 dark:peer-checked:bg-blue-300 dark:peer-checked:text-blue-700 dark:peer-checked:border-blue-300",
      "contract"   => "peer-checked:bg-purple-100 peer-checked:text-purple-600 peer-checked:border-purple-600 dark:peer-checked:bg-purple-300 dark:peer-checked:text-purple-700 dark:peer-checked:border-purple-300",
      "internship" => "peer-checked:bg-yellow-100 peer-checked:text-yellow-600 peer-checked:border-yellow-600 dark:peer-checked:bg-yellow-300 dark:peer-checked:text-yellow-700 dark:peer-checked:border-yellow-300",
      "temporary"  => "peer-checked:bg-orange-100 peer-checked:text-orange-600 peer-checked:border-orange-600 dark:peer-checked:bg-orange-300 dark:peer-checked:text-orange-700 dark:peer-checked:border-orange-300",
      "freelance"  => "peer-checked:bg-red-100 peer-checked:text-red-600 peer-checked:border-red-600 dark:peer-checked:bg-red-300 dark:peer-checked:text-red-700 dark:peer-checked:border-red-300"
    }[offer] || "peer-checked:bg-gray-100 peer-checked:text-gray-600 peer-checked:border-gray-600 dark:peer-checked:bg-gray-300 dark:peer-checked:text-gray-700 dark:peer-checked:border-gray-300"
  end

  def job_type_colour(offer)
    {
      "onsite" => "bg-rose-100 text-rose-600 dark:bg-rose-300 dark:text-rose-700 dark:border-rose-300",
      "remote" => "bg-fuchsia-100 text-fuchsia-600 dark:bg-fuchsia-300 dark:text-fuchsia-700 dark:border-fuchsia-300",
      "hybrid" => "bg-teal-100 text-teal-600 dark:bg-teal-300 dark:text-teal-700 dark:border-teal-300"
    }[offer] || "bg-gray-100 text-gray-600 dark:bg-gray-300 dark:text-gray-700 dark:border-gray-300"
  end

  def job_filter_colour(offer)
    {
      "onsite" => "peer-checked:bg-rose-100 peer-checked:text-rose-600 peer-checked:border-rose-600 dark:peer-checked:bg-rose-300 dark:peer-checked:text-rose-700 dark:peer-checked:border-rose-300",
      "remote"  => "peer-checked:bg-fuchsia-100 peer-checked:text-fuchsia-600 peer-checked:border-fuchsia-600 dark:peer-checked:bg-fuchsia-300 dark:peer-checked:text-fuchsia-700 dark:peer-checked:border-fuchsia-300",
      "hybrid"  => "peer-checked:bg-teal-100 peer-checked:text-teal-600 peer-checked:border-teal-600 dark:peer-checked:bg-teal-300 dark:peer-checked:text-teal-700 dark:peer-checked:border-teal-300"
    }[offer] || "peer-checked:bg-gray-100 peer-checked:text-gray-600 peer-checked:border-gray-600 dark:peer-checked:bg-gray-300 dark:peer-checked:text-gray-700 dark:peer-checked:border-gray-300"
  end
end
