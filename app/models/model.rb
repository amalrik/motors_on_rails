class Model < ActiveRecord::Base
  belongs_to :make, counter_cache: :maker_count
end
