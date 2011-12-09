class Transaction < ActiveRecord::Base
  attr_accessible :amount, :description, :long_description, :credited_id, :debitted_id, :custom_credit, :custom_debit
  
  belongs_to :user
  
  belongs_to :debitted, :class_name => "Account"
  belongs_to :credited, :class_name => "Account"
  
  before_save :sanitize_debit, :sanitize_credit
  
  validates :amount, :presence => true
  # validates :description, :presence => true
  
  
  private
  
  # @transaction.debitted_id = 0 if !@transaction.custom_debit.blank?     # debitted_id is 0 if custom_debit is not blank
  # @transaction.credited_id = 0 if !@transaction.custom_credit.blank?    # credited_id is 0 if custom_credit is not blank
  
    def sanitize_debit
      self.debitted_id = nil if !self.custom_debit.blank?   # set debitted_id to 0 if custom_debit is not blank
    end
    
    def sanitize_credit
      self.credited_id = nil if !self.custom_credit.blank?  # set credited_id to 0 if custom_credit is not blank
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
#  credited_id      :integer
#  debitted_id      :integer
#  long_description :string(255)
#  custom_credit    :string(255)
#  custom_debit     :string(255)
#

