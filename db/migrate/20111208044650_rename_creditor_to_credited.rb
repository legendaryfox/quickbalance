class RenameCreditorToCredited < ActiveRecord::Migration
  def self.up
    rename_column :transactions, :creditor_id, :credited_id
    rename_column :transactions, :debitor_id, :debitted_id
  end

  def self.down
    rename_column :transactions, :credited_id, :creditor_id
    rename_column :transactions, :debitted_id, :debitor_id
  end
end
