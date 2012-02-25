class Registration < ActiveRecord::Base
  has_many :child_registrations
  belongs_to :registration_session
  belongs_to :parent

  # def title was created automatically because you didn't specify a string field
  # when you ran the refinery_engine generator. Love, Refinery CMS.
  def title
    "Application for the #{registration_session}"
  end

  def fee_amount
    @fee_amount ||= calculate_fee_amount
  end

  def fee?
    true if fee_amount
  end

  def paypal_url(return_url)
    values = {
      :business => "office@campcalvarynj.com",
      :cmd => "_cart",
      :upload => 1,
      :return => return_url,
      :invoice => id
    }

    child_registrations.each_with_index do |item, index|
      values.merge!({
        "amount_#{index + 1}" => item.fee.amount,
        "item_name_#{index + 1}" => "#{Date.today.year} registration for #{item.child.name}",
        "item_number_#{index + 1}" => item.id,
        "quantity_#{index + 1}" => 1
      })
    end
    "https://www.paypal.com/cgi-bin/webscr?" + values.to_query
  end

private

  def calculate_fee_amount
    a = child_registrations.map{|r| r.fee.amount}.sum
    return a unless a.zero?
    false
  end
end
