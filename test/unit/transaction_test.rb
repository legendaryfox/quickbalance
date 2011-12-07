require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end



# == Schema Information
#
# Table name: transactions
#
#  id               :integer         not null, primary key
#  user_id          :integer
#  amount           :decimal(, )
#  description      :text
#  created_at       :datetime
#  updated_at       :datetime
#  credit_id        :integer
#  debit_id         :integer
#  long_description :string(255)
#  custom_credit    :string(255)
#  custom_debit     :string(255)
#

