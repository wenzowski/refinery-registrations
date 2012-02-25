Given /^I have no child_registrations$/ do
  ChildRegistration.delete_all
end


Then /^I should have ([0-9]+) child_registrations?$/ do |count|
  ChildRegistration.count.should == count.to_i
end
