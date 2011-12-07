class CreateTransactions < ActiveRecord::Migration
  def self.up
    create_table :transactions do |t|
      t.integer :user_id
      t.decimal :amount, :precision => 8, :scale => 2
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :transactions
  end
end
