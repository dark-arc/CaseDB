class Anatomy < ActiveRecord::Base
  acts_as_nested_set

  def path
    path = ""
    self.ancestors.each do |anc|
      path += "#{anc.name}/"
    end
    path += name
    return path
  end
end
