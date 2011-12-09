class AddIDsToPendingTransactions < ActiveRecord::Migration
  def self.up
    add_column :pending_transactions, :credited_id, :integer
    add_column :pending_transactions, :debitted_id, :integer
  end

  def self.down
    remove_column :pending_transactions, :debitted_id
    remove_column :pending_transactions, :credited_id
  end
end
