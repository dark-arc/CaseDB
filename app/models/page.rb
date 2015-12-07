class Page < ActiveRecord::Base
  validates :name, uniqueness: true
end
