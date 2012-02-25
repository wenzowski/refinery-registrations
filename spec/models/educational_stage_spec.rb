require 'spec_helper'

describe EducationalStage do

  def reset_educational_stage(options = {})
    @valid_attributes = {
      :id => 1,
      :name => "RSpec is great for testing too"
    }

    @educational_stage.destroy! if @educational_stage
    @educational_stage = EducationalStage.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_educational_stage
  end

  context "validations" do
    
    it "rejects empty name" do
      EducationalStage.new(@valid_attributes.merge(:name => "")).should_not be_valid
    end

    it "rejects non unique name" do
      # as one gets created before each spec by reset_educational_stage
      EducationalStage.new(@valid_attributes).should_not be_valid
    end
    
  end

end