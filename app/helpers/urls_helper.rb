module UrlsHelper
  SAFE_PROTOCOLS = %w[http https mailto].freeze

  def safe_url(url)
    return nil if url.blank?

    uri = URI.parse url

    if uri.scheme.present? && SAFE_PROTOCOLS.include?(uri.scheme.downcase)
      uri.to_s
    else
      URI::HTTPS.build(host: url).to_s
    end

  rescue URI::InvalidURIError
    nil
  end
end
