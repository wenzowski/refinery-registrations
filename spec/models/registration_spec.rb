require 'spec_helper'

describe Registration do

  def reset_registration(options = {})
    @valid_attributes = {
      :id => 1
    }

    @registration.destroy! if @registration
    @registration = Registration.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_registration
  end

  context "validations" do
    
  end

end