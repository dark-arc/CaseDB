class Mark < ActiveRecord::Base
  belongs_to :person
  belongs_to :anatomy
  belongs_to :mark_type
end
