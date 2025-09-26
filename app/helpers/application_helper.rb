module ApplicationHelper
  include Pagy::Frontend


  def render_filter_pill(filter_type, key, value, index)
    checked = filter_pill_checked?(filter_type, value)
    content_tag(:div, class: "filter-pill d-inline-flex align-items-center gap-1 me-1 mb-1",
                data: { filter_pills_target: "checkboxWrapper" }) do
                  concat check_box_tag("q[#{filter_type}_in][]", value, checked,
                                       id: "#{filter_type}_#{index}",
                                       class: "filter-checkbox",
                                       data: { filter_pills_target: "checkbox" })
                  concat content_tag(:span, class: filter_pill_badge_classes(filter_type, key, checked)) do
                    concat content_tag(:span, key.to_s.humanize.titleize)
                    concat content_tag(:span, checked ? "×" : "+", class: "action-symbol")
                  end
                end
  end


  private

  def filter_pill_checked?(filter_type, value)
    params.dig(:q, :"#{filter_type}_in")&.map(&:to_i)&.include?(value)
  end

  def filter_pill_badge_classes(filter_type, key, checked)
    base_classes = "badge px-2 py-1 badge-pill d-flex align-items-center justify-content-between"
    if checked
      color_method = :"#{filter_type.to_s.singularize}_colour"
      color = send(color_method, key.to_s)
      color_class = "bg-#{color}-lt text-#{color}"
    else
      color_class = "bg-secondary-lt text-secondary"
    end
    "#{base_classes} #{color_class}"
  end
end
