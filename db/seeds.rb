
Refinery::I18n.frontend_locales.each do |lang|
  I18n.locale = lang

  Refinery::User.find_each do |user|
    user.plugins.where(name: 'refinerycms-banners').first_or_create!(
      position: (user.plugins.maximum(:position) || -1) +1
    )
  end if defined?(Refinery::User)

  Refinery::Page.where(link_url: (url = "/banners")).first_or_create!(
    title: 'Banners',
    deletable: false,
    menu_match: "^#{url}(\/|\/.+?|)$"
  ) do |page|
    Refinery::Pages.default_parts.each_with_index do |part, index|
      page.parts.build title: part[:title], slug: part[:slug], body: nil, position: index
    end
  end if defined?(Refinery::Page)
end


#if defined?(Page)
#  page = Page.create(
#    :title => 'Banners',
#    :link_url => '/banners',
#    :deletable => false,
#    :position => ((Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)+1),
#    :menu_match => '^/banners(\/|\/.+?|)$'
#  )
#  Page.default_parts.each do |default_page_part|
#    page.parts.create(:title => default_page_part, :body => nil)
#  end
#end