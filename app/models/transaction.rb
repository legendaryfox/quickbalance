class Transaction < ActiveRecord::Base
  attr_accessible :amount, :description, :credit_id, :debit_id
  
  belongs_to :user
  
  belongs_to :debit, :class_name => "Account"
  belongs_to :credit, :class_name => "Account"
  
  
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

