class AddShorthandTextToPendingTransactions < ActiveRecord::Migration
  def self.up
    add_column :pending_transactions, :shortcode, :string
  end

  def self.down
    remove_column :pending_transactions, :shortcode
  end
end
