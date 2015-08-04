class Person < ActiveRecord::Base
  has_many :event_people
  has_many :events,
           :through => :event_people
  has_many :case_files,
           -> {distinct},
           :through => :events

  EventPerson.categories.each do |type|
    type = type[0].to_sym
    has_many type,
-> {where 'event_people.category' => type},

             :through => :event_people,
             :source => :event
  end

  enum gender: [
         :unknown,
         :male,
         :female,
         :asexual,
         :transmale,
         :transfemale
       ], _prefix: true

  enum eye: [
         :unknown,
         :lightBlue,
         :blue,
         :blueGray,
         :gray,
         :blueGrayBrown,
         :grayGreenBrown,
         :green,
         :greenBrown,
         :lightBrown,
         :brown,
         :hazel,
         :darkBrown,
         :black
       ], _suffix: 'colour'

  enum height: [
         :dwarf,
         :short,
         :average,
         :tall
       ], _prefix:true

  enum weight: [
        :slight,
        :average,
        :overweight,
        :obese
      ], _prefix:true

  enum hair_colour: [
         :unknown,
         :black,
         :brown,
         :blond,
         :auburn,
         :chestnut,
         :red,
         :gray
       ], _suffix: true

  enum hair_length: [
         :unknown,
         :bald,
         :short,
         :medium,
         :shoulderLength,
         :backLength
       ], _suffix: true

  enum moustache: [:unknown],_prefix: true
  enum beard: [:unknown],_prefix: true

  enum ics: [
         :unknown,
         :northEurope,
         :southEurope,
         :black,
         :westAsia,
         :eastAsia,
         :arabic
       ], _prefix: true
end
