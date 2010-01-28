class CreatePopupAds < ActiveRecord::Migration
  def self.up
    create_table :popup_ads do |t|
      t.integer :cpl
      t.string :call_to_action
      t.string :url

      t.timestamps
    end
  end

  def self.down
    drop_table :popup_ads
  end
end
