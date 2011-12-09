class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  attr_accessible :transaction_attributes
  
  
  has_many :transactions
  has_many :accounts
  
  accepts_nested_attributes_for :transactions
  

  def make_transaction(amount, debitted_id, credited_id, description="", long_description="")
  
  
    # First, do some sanitation.
    custom_credit = ""
    custom_debit = ""
    
   if self.accounts.find_by_id(debitted_id.to_i)
     # This is a valid account that belongs to User
     custom_debit = self.accounts.find_by_id(debitted_id.to_i).name
   else
     custom_debit = debitted_id.to_s
     debitted_id = 0
   end
   
   if self.accounts.find_by_id(credited_id.to_i)
     # This is a valid account that belongs to User
     custom_credit = self.accounts.find_by_id(credited_id.to_i).name
   else
     custom_credit = credited_id.to_s
     credited_id = 0
   end
   
=begin    
    ## Debitor
    if debitted_id.is_a? Integer
      
      if self.accounts.find_by_id(debitted_id.to_i)
        custom_debit = self.accounts.find_by_id(debitted_id.to_i).name
      else
        # Error...
        custom_debit = debitted_id.to_s
        debitted_id = 0
      end
      
    else
      # Specified a string - save as a string
      custom_debit = debitted_id.to_s
      debitted_id = 0 # Our custom account
    end
    
    ## Creditor
    if credited_id.is_a? Integer
      
      if self.accounts.find_by_id(credited_id.to_i)
        custom_credit = self.accounts.find_by_id(credited_id.to_i).name
      else
        # Error
        custom_credit= credited_id.to_s
        credited_id = 0
      end
    else
      #Specified a string - save as a string
      custom_credit = credited_id.to_s
      credited_id = 0 # Our custom account
    end
=end
    
    self.transactions.create( :amount => amount, 
                              :credited_id => credited_id, 
                              :debitted_id => debitted_id, 
                              :custom_credit => custom_credit, 
                              :custom_debit => custom_debit,
                              :description => description,
                              :long_description => long_description)
  
  end
  
    
  
  
end


# == Schema Information
#
# Table name: users
#
#  id                     :integer         not null, primary key
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(128)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer         default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  name                   :string(255)
#

