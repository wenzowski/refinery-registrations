require 'spec_helper'

describe Child do

  def reset_child(options = {})
    @valid_attributes = {
      :id => 1,
      :name => "RSpec is great for testing too"
    }

    @child.destroy! if @child
    @child = Child.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_child
  end

  context "validations" do
    
    it "rejects empty name" do
      Child.new(@valid_attributes.merge(:name => "")).should_not be_valid
    end

    it "rejects non unique name" do
      # as one gets created before each spec by reset_child
      Child.new(@valid_attributes).should_not be_valid
    end
    
  end

end