class Location < ActiveRecord::Base
  include LocationEnum
  acts_as_nested_set

  belongs_to :event
  belongs_to :parent

  def path
    path = ''
    ancestors.each do |anc|
      path += "#{anc.name}/"
    end
    path += name
    path
  end
end
