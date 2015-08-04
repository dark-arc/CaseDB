class Event < ActiveRecord::Base
  belongs_to :case_file
  has_many :event_people
  has_many :people,
           :through => :event_people
  
  accepts_nested_attributes_for :event_people

  EventPerson.categories.each do |type|
  has_many type[0].to_sym,
           -> {where category: type[0].to_sym},
           :through => :event_people,
           :source => :person
  end

  def tagline
    return body.split('. ').first if
      super == nil
    return super
  end
end
