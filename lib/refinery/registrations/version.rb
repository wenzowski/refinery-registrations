module Refinery
  module Registrations
    module Version
      @major  = 0
      @minor  = 0
      @tiny   = 1
      @pre    = 'beta'

      class << self
        attr_reader :major, :minor, :tiny

        def to_s
          return [@major, @minor, @tiny, @pre].compact.join('.') if @pre
          [@major, @minor, @tiny].compact.join('.')
        end
      end
    end
  end
end