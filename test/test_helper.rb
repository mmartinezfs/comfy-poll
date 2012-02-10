ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Example usage:
  #   assert_has_errors_on( @record, [:field_1, :field_2] )
  #   assert_has_errors_on( @record, {:field_1 => 'Message1', :field_2 => 'Message 2'} )
  def assert_has_errors_on(record, fields)
    fields = [fields].flatten unless fields.is_a?(Hash)
    fields.each do |field, message|
      assert record.errors.to_hash.has_key?(field.to_sym), "#{record.class.name} should error on invalid #{field}"
      if message && record.errors[field].is_a?(Array) && !message.is_a?(Array)
        assert_not_nil record.errors[field].index(message)
      elsif message
        assert_equal message, record.errors[field]
      end
    end
  end
end
