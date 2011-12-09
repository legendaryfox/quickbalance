class CreateShortcodeParsers < ActiveRecord::Migration
  def self.up
    create_table :shortcode_parsers do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :shortcode_parsers
  end
end
