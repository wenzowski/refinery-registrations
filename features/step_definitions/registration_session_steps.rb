Given /^I have no registration_sessions$/ do
  RegistrationSession.delete_all
end


Then /^I should have ([0-9]+) registration_sessions?$/ do |count|
  RegistrationSession.count.should == count.to_i
end
