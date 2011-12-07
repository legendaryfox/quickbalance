class Account < ActiveRecord::Base
  attr_accessible :name, :debit_shorthand, :credit_shorthand, :credit_transactions, :debit_transactions
  
  belongs_to :user
  
  has_many :transactions
  has_many :credit_transactions, :through => :transactions, :source => :credit
  has_many :debit_transactions, :through => :transactions, :source => :debit
  
  
=begin  
  has_many  :credit_transactions, 
            :through => :transactions, 
            :foreign_key => "credit_id"
            
  has_many  :debit_transactions,
            :through => :transactions,
            :foreign_key => "debit_id"
=end            
            
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

