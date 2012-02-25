require 'spec_helper'

describe ChildRegistration do

  def reset_child_registration(options = {})
    @valid_attributes = {
      :id => 1
    }

    @child_registration.destroy! if @child_registration
    @child_registration = ChildRegistration.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_child_registration
  end

  context "validations" do
    
  end

end