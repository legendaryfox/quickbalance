class Transaction < ActiveRecord::Base
  attr_accessible :amount, :description, :long_description, :credited_id, :debitted_id, :custom_credit, :custom_debit
  
  belongs_to :user
  
  belongs_to :debitted, :class_name => "Account"
  belongs_to :credited, :class_name => "Account"
  
  validates :amount, :presence => true
  # validates :description, :presence => true
  
  
  
  
  
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
#  credited_id      :integer
#  debitted_id      :integer
#  long_description :string(255)
#  custom_credit    :string(255)
#  custom_debit     :string(255)
#

