class TransactionsController < ApplicationController
  before_filter :authenticate_user!
  def new
    @transaction = Transaction.new
  end
  
  def create
    @transaction = current_user.transactions.build(params[:transaction])
    if @transaction.save
      redirect_to transactions_path, :success => "Transaction successfully created."
    else
      render 'new'
    end
  end

  def index
    @transactions = current_user.transactions.all
  end

  def show
  end

end
