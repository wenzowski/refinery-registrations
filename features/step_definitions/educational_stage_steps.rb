Given /^I have no educational_stages$/ do
  EducationalStage.delete_all
end

Given /^I (only )?have educational_stages titled "?([^\"]*)"?$/ do |only, titles|
  EducationalStage.delete_all if only
  titles.split(', ').each do |title|
    EducationalStage.create(:name => title)
  end
end

Then /^I should have ([0-9]+) educational_stages?$/ do |count|
  EducationalStage.count.should == count.to_i
end
