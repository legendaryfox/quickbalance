class Account < ActiveRecord::Base
  attr_accessible :name, :debit_shorthand, :credit_shorthand, :credit_transactions, :debit_transactions
  
  belongs_to :user
  
  has_many :credit_transactions, :class_name => "Transaction", :foreign_key => 'credited_id'
  has_many :debit_transactions, :class_name => "Transaction", :foreign_key => 'debitted_id'
  
  
 
  
  
  
            
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

