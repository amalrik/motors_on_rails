class Model < ActiveRecord::Base
  belongs_to :make
  include Upsertable
end
