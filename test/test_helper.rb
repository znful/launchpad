ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
    def sign_in(user)
      Current.session = user.sessions.create!

      ActionDispatch::TestRequest.create.cookie_jar.tap do |cookie_jar|
        cookie_jar.signed[:session_id] = Current.session.id
        cookies[:session_id] = cookie_jar[:session_id]
      end
    end

    def sign_out
      Current.session&.destroy
      cookies.delete(:session_id)
    end
  end
end
