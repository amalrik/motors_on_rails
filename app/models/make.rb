class Make < ActiveRecord::Base
  has_many :models
  include Upsertable
end
