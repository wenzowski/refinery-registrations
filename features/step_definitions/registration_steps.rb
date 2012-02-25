Given /^I have no registrations$/ do
  Registration.delete_all
end


Then /^I should have ([0-9]+) registrations?$/ do |count|
  Registration.count.should == count.to_i
end
