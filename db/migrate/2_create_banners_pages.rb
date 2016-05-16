class CreateBannersPages < ActiveRecord::Migration
  def up
    create_table :refinery_banners_pages, :id => false do |t|
      t.integer :page_id
      t.integer :banner_id
      t.timestamps
    end

    add_index :refinery_banners_pages, :page_id
    add_index :refinery_banners_pages, :banner_id
  end

  def down
    drop_table :refinery_banners_pages
  end
end
