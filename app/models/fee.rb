require 'money'
Money.default_currency = Money::Currency.new(RefinerySetting.find_or_set(:iso_4217_default_currency, 'USD')) if defined?(RefinerySetting)

class Fee < ActiveRecord::Base
  belongs_to :billable, polymorphic: true
  composed_of :amount,
    class_name: "Money",
    mapping: [%w(cents cents), %w(currency currency_as_string)],
    constructor: Proc.new { |cents, currency| Money.new(cents || 0, currency || Money.default_currency) },
    converter: Proc.new { |value| value.respond_to?(:to_money) ? value.to_money : raise(ArgumentError, "Can't convert #{value.class} to Money") }
end
