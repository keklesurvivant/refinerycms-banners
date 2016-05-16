class CreateBanners < ActiveRecord::Migration

  def up
    create_table :refinery_banners do |t|
      t.string :name
      t.integer :image_id
      t.string :url
      t.boolean :is_active
      t.date :start_date
      t.date :expiry_date
      t.integer :position

      t.timestamps
    end

    add_index :refinery_banners, :id

    # load(Rails.root.join('db', 'seeds', 'banners.rb'))
  end

  def down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "banners"})
    end

    #if defined?(Page)
    #  Page.delete_all({:link_url => "/banners"})
    #end

    drop_table :refinery_banners
  end

end
