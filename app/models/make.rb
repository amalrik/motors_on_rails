class Make < ActiveRecord::Base
  has_many :models

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
