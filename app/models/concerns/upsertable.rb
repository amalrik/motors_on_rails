module Upsertable
  extend ActiveSupport::Concern

  module ClassMethods
    def update_or_create(attributes)
      assign_or_new(attributes).save
    end

    private
    def assign_or_new(attributes)
      obj = first || new
      obj.assign_attributes(attributes)
      obj
    end
  end

end