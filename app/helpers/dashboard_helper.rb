module DashboardHelper
  def request_verification_button(offer)
    if offer.pending? || offer.verified?
      content_tag(:p, offer.verification_status.titleize, class: "dropdown-item active")
    elsif offer.rejected?
      content_tag(:p, "Rejected", class: "dropdown-item disabled")
    else
      button_to "Request Verification", offer_path(offer, offer: { verification_status: "pending" }, redirect_to: request.fullpath), method: :patch, class: "dropdown-item"
    end
  end
end
