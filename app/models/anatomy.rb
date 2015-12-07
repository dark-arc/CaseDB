# Anatomy model
class Anatomy < ActiveRecord::Base
  acts_as_nested_set

  def path
    path = ''
    ancestors.each do |anc|
      path += "#{anc.name}/"
    end
    path += name
    path
  end
end
