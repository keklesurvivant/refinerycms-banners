Given /^I have no banners$/ do
  ::Refinery::Banners::Banner.delete_all
end

Given /^I (only )?have banners titled "?([^\"]*)"?$/ do |only, titles|
  ::Refinery::Banners::Banner.delete_all if only
  titles.split(', ').each do |title|
    ::Refinery::Banners::Banner.create(:name => title)
  end
end

Then /^I should have ([0-9]+) banners?$/ do |count|
  ::Refinery::Banners::Banner.count.should == count.to_i
end
