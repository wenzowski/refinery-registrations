Given /^I have no children$/ do
  Child.delete_all
end

Given /^I (only )?have children titled "?([^\"]*)"?$/ do |only, titles|
  Child.delete_all if only
  titles.split(', ').each do |title|
    Child.create(:name => title)
  end
end

Then /^I should have ([0-9]+) children?$/ do |count|
  Child.count.should == count.to_i
end
