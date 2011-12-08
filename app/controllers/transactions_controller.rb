class TransactionsController < ApplicationController
  before_filter :authenticate_user!
  def new
    @transaction = Transaction.new
  end
  
  def create
    @transaction = current_user.transactions.build(params[:transaction])
    if current_user.make_transaction!(params[:transaction][:amount], 
                                      params[:transaction][:debitted_id], 
                                      params[:transaction][:credited_id],
                                      params[:transaction][:description])
                                      
      redirect_to transactions_path, :success => "Transaction successfully created."
    else
      render 'new'
    end
  end

  def index
    @transactions = current_user.transactions.all(:order => 'created_at DESC')
  end

  def show
  end

end
