class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.integer :user_id
      t.string :name
      t.string :debit_shorthand
      t.string :credit_shorthand

      t.timestamps
    end
  end

  def self.down
    drop_table :accounts
  end
end
