class RenameCreditDebit < ActiveRecord::Migration
  def self.up
    rename_column :transactions, :credit_id, :creditor_id
    rename_column :transactions, :debit_id, :debitor_id
  end

  def self.down
    rename_column :transactions, :creditor_id, :credit_id
    rename_column :transactions, :debitor_id, :debit_id
  end
end
