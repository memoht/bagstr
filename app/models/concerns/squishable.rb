module Squishable
  extend ActiveSupport::Concern

  included do
    before_validation :squish_fields

  private

    def squish_fields
      attribute_names.each do |name|
        if send(name).respond_to?(:squish)
          send("#{name}=", send(name).squish)
        end
      end
    end

  end
end
