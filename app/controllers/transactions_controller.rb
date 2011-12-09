class TransactionsController < ApplicationController
  before_filter :authenticate_user!
  def new
    #@transaction = Transaction.new
    @transaction = current_user.transactions.new
  end
  
  def create
    @transaction = current_user.transactions.new(params[:transaction])
    
    # begin code to be moved to before_save function
    # @transaction.debitted_id = 0 if !@transaction.custom_debit.blank?     # debitted_id is 0 if custom_debit is not blank
    # @transaction.credited_id = 0 if !@transaction.custom_credit.blank?    # credited_id is 0 if custom_credit is not blank
    # end 
    
    
    if @transaction.save
      @transactions = current_user.transactions.all(:order => 'created_at DESC')
      redirect_to transactions_path, :success => "Transaction successfully created."
    else
      @transactions = current_user.transactions.all(:order => 'created_at DESC')
      render 'index'
    end
    
    
    
    
    
    
=begin   
    debit = params[:transaction][:custom_debit].blank? ? params[:transaction][:debitted_id] : params[:transaction][:custom_debit]
    # debit ||= params[:transaction][:debitted_id]
    credit = params[:transaction][:custom_credit].blank? ? params[:transaction][:credited_id] : params[:transaction][:custom_credit]
    
    # credit = params[:transaction][:custom_credit]
    # credit ||= params[:transaction][:credited_id]
    
    
    # if Transaction.create(:user_id => current_user.id, )
    
    if current_user.make_transaction(params[:transaction][:amount], 
                                      debit, 
                                      credit,
                                      params[:transaction][:description])
                                      
      #redirect_to transactions_path, :success => "Transaction successfully created."
      

      render 'new'
    else
      render 'new'
    end
    
=end
  end

  def index
    @transaction = current_user.transactions.new
    @transactions = current_user.transactions.all(:order => 'created_at DESC')
  end

  def show
  end

end
