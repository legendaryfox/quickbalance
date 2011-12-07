class ChangeCustomPartyIoTransactions < ActiveRecord::Migration
  def self.up
    add_column :transactions, :custom_credit, :string
    add_column :transactions, :custom_debit, :string
    remove_column :transactions, :custom_party
  end

  def self.down
    remove_column :transactions, :custom_credit
    remove_column :transactions, :custom_debit
    add_column :transactions, :custom_party, :string
  end
end
