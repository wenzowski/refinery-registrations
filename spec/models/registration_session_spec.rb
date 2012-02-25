require 'spec_helper'

describe RegistrationSession do

  def reset_registration_session(options = {})
    @valid_attributes = {
      :id => 1
    }

    @registration_session.destroy! if @registration_session
    @registration_session = RegistrationSession.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_registration_session
  end

  context "validations" do
    
  end

end