require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: accounts
#
#  id               :integer         not null, primary key
#  user_id          :integer
#  name             :string(255)
#  debit_shorthand  :string(255)
#  credit_shorthand :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

