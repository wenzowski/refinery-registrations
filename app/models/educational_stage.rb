class EducationalStage < ActiveRecord::Base

  has_many :child_registrations
  has_many :fees, as: :billable, dependent: :delete_all

  acts_as_indexed fields: [:name]

  validates :name, presence: true, uniqueness: true

  def reduced_registration_amount
    reduced_registration_fee.amount
  end
  def reduced_registration_amount=(val)
    fee = reduced_registration_fee
    fee.amount = val
    fee.save
  end

  def regular_registration_amount
    regular_registration_fee.amount
  end
  def regular_registration_amount=(val)
    fee = regular_registration_fee
    fee.amount = val
    fee.save
  end

  def current_fee
    RegistrationSession.early_price? ? reduced_registration_fee : regular_registration_fee
  end

  def to_s
    name
  end

private

  def reduced_registration_fee
    find_or_create_fee(0)
  end

  def regular_registration_fee
    find_or_create_fee(1)
  end

  def find_or_create_fee(index)
    fee_from_db(index) || fee_from_unsaved_object(index) || generate_fee(index)
  end

  def fee_from_db(index)
    fees.order('id asc')[index]
  end

  def fee_from_unsaved_object(index)
    #fees don't have an id until they're saved
    fees[index]
  end

  def generate_fee(index)
    while !fees[index] do
      fee = add_fee
    end
    fee
  end

  def add_fee
    fees << fees.new
    fees.last
  end

end
