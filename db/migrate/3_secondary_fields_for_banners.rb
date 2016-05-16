class SecondaryFieldsForBanners < ActiveRecord::Migration

  def up
    add_column :refinery_banners, :title, :string
    add_column :refinery_banners, :description, :string
  end

  def down
    remove_column :refinery_banners, :title
    remove_column :refinery_banners, :description
  end

end