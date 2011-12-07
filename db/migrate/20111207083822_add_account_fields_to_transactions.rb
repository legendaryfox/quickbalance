class AddAccountFieldsToTransactions < ActiveRecord::Migration
  def self.up
    add_column :transactions, :credit_id, :integer
    add_column :transactions, :debit_id, :integer
    add_column :transactions, :long_description, :string
    add_column :transactions, :custom_party, :string
  end

  def self.down
    remove_column :transactions, :custom_party
    remove_column :transactions, :long_description
    remove_column :transactions, :debit_id
    remove_column :transactions, :credit_id
  end
end
