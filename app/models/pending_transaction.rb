class PendingTransaction < ActiveRecord::Base
  attr_accessible :amount, :description, :long_description, :credited_id, :debitted_id, :custom_credit, :custom_debit, :shortcode
  # attr_accessible :shortcode    # only created via shortcode
  
  belongs_to :user
  
  belongs_to :debitted, :class_name => "Account"
  belongs_to :credited, :class_name => "Account"
  
  # validates :amount, :presence => true
  
  before_save :interpret_shortcode
  
  
  def interpret_shortcode
  
    # Possible forms we're expecting:
    # w 100       = This means we spent 100 from w
    # w 100 Bob   = This means debit w 100 to custom Bob
    # W 100       = This means we got 100 into W
    # W 100 Bob   = This means credit W 100 from Bob
    
    # (As of December 9, 2011:)
    # Thus, we assume the first two arguments are required.
    # <first> = debit
    # <second> = amount
    # <third> = 
    # Ideally - break by the *middle* number
    # What we CAN do easily: split by the first number we see
    
    # A transaction has the following: debit_id, custom_debit, amount, credit_id, custom_credit, description, long description
    
    # First step - explode the input into array
    # We first find the pivot - the Amount
    amount = self.shortcode.scan(/\d+/).first   # We only take the first argument.
    # if is_a_number?(amount)
    if amount.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
      # Ok, this is a number. We can proceed.

      # Next, we split this.
      # We know that there will only be 2 parts remaining after the pivot
      transaction_args = self.shortcode.split(amount, 2)     # Force into split to only two parts
      debit_code = transaction_args.first.strip
      credit_code = transaction_args.last.strip
      
      # Now that we have debit_code and credit_code, see if they match shorthands   
      debit = self.user.accounts.find_by_debit_shorthand(debit_code)
      if debit
        # Shortcode provided matches an account
        puts "we found a debit"
        debitted_id = debit.id
        custom_debit = debit.name
      else
        # Shortcode provided does NOT match an account.
        puts "we didn't find a debit"
        debitted_id = nil
        custom_debit =  debit_code
      end
      
      # Do the same for credit
      credit = self.user.accounts.find_by_credit_shorthand(credit_code)
      if credit
        # Shortcode is a hit for credit account
        credited_id = credit.id
        custom_credit = credit.name
      else
        credited_id = nil
        custom_credit = credit_code
      end
      
      # Now that we have all the information we need, we will set the information.
      self.amount = amount
      self.debitted_id = debitted_id
      self.custom_debit = custom_debit
      self.credited_id = credited_id
      self.custom_credit = custom_credit
      
    else
      # We can't find a numeric. Error out.
      puts "not a number"
    end
  
  end
  
  
    
=begin 
  def self.is_a_number?(s)
    s.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true 
  end
=end
  
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
#  credited_id      :integer
#  debitted_id      :integer
#

