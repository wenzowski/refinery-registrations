class Child < ActiveRecord::Base

  has_many :child_registrations
  belongs_to :parent

  validates :name, :presence => true

end
