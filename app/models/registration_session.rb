class RegistrationSession < ActiveRecord::Base
  has_many :registrations

  class << self

    def next
      self.where('begin >= ?', Date.today.beginning_of_year).order('registration_begin ASC').limit(1)
    end

    def open?
      true unless open.empty?
    end
    def open
      self.where('registration_begin <= ?', Date.today).where('registration_end > ?', Date.today)
    end

    def early_price?
      true unless early_price.empty?
    end
    def early_price
      open.where('early_registration_end > ?', Date.today)
    end

    def normal_price?
      true unless normal_price.empty?
    end
    def normal_price
      open.where('early_registration_end <= ?', Date.today)
    end

    def default_dates(year)
      {
        begin:                  default_begin(year),
        end:                    default_end(year),
        registration_begin:     default_registration_begin(year),
        early_registration_end: default_early_registration_end(year),
        registration_end:       default_registration_end(year)
      }
    end
    def default_begin(year)
      Date.new(year, 6).next_week.advance(weeks:2)
    end
    def default_end(year)
      Date.new(year, 9).beginning_of_week.advance(days:4)
    end
    def default_registration_begin(year)
      Date.new(year, 2).beginning_of_week.advance(weeks:3)
    end
    def default_early_registration_end(year)
      Date.new(year, 4, 1)
    end
    def default_registration_end(year)
      Date.new(year, 4, 1)
    end

  end

  def open?
    true if registration_begin <= Date.today && registration_end > Date.today
  end

  def early_price?
    true if early_registration_end > Date.today
  end

  def normal_price?
    true if early_registration_end <= Date.today
  end

  def title
    "#{self.begin.year} session"
  end

  def to_s
    title
  end

end
