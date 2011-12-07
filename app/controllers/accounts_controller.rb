class AccountsController < ApplicationController
  before_filter :authenticate_user!
  def new
    @account = Account.new
  end
  
  def create
    @account = current_user.accounts.build(params[:account])
    if @account.save
      redirect_to accounts_path, :success => "Account successfully created."
    else
      render 'new'
    end
  end

  def show
    @account = Account.find_by_id(params[:id])
  end

  def index
    @accounts = current_user.accounts.all
  end

end
