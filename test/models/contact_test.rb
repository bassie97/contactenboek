require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "account should not be added if name is not set" do
    contact = Contact.new(name: '', email: 'test@example.nl')
    assert_not contact.save
  end

  test "account should not be added if email is invalid" do
    contact = Contact.new(name: 'Test User', email: 'test')
    assert_not contact.save
  end
end
