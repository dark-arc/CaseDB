# Alias model
class Alias < ActiveRecord::Base
  scope :default_name, -> { where(default: true).limit(1) }
  belongs_to :person, touch: true
end
