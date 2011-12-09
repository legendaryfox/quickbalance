class PendingTransaction < ActiveRecord::Base
end


# == Schema Information
#
# Table name: pending_transactions
#
#  id               :integer         not null, primary key
#  user_id          :integer
#  amount           :decimal(8, 2)
#  description      :text
#  long_description :text
#  custom_credit    :string(255)
#  custom_debit     :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  shortcode        :string(255)
#

