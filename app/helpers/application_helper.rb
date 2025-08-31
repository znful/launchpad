module ApplicationHelper
  include Pagy::Frontend

  def pagy_path_for(page)
    url_for(params.permit!.to_h.merge(page: page))
  end
end
