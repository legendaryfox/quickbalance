class CreatePendingTransactions < ActiveRecord::Migration
  def self.up
    create_table :pending_transactions do |t|
      t.integer :user_id
      t.decimal :amount, :precision => 8, :scale => 2
      t.text :description
      t.text :long_description
      t.string :custom_credit
      t.string :custom_debit

      t.timestamps
    end
  end

  def self.down
    drop_table :pending_transactions
  end
end
