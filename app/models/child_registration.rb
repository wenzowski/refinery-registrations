class ChildRegistration < ActiveRecord::Base

  belongs_to :registration #TODO destroy orphan registrations
  belongs_to :child #TODO destroy orphan children
  belongs_to :educational_stage
  has_many :fees, as: :billable, dependent: :delete_all

  before_save :update_fee
  accepts_nested_attributes_for :child

  # def title was created automatically because you didn't specify a string field
  # when you ran the refinery_engine generator. Love, Refinery CMS.
  def title
    child.name
  end

  def fee
    fees.first || add_fee
  end

  def update_fee
    fee.amount = educational_stage.current_fee.amount
    fee.save
  end

private

  def add_fee
    fees << fees.new
    fees.last
  end

end
