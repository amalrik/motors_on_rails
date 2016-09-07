class Model < ActiveRecord::Base
  belongs_to :make, counter_cache: :maker_count

  def self.update_or_create(attributes)
    assign_or_new(attributes).save
  end

  private
  def self.assign_or_new(attributes)
    obj = first || new
    obj.assign_attributes(attributes)
    obj
  end
end
