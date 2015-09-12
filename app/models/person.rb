# Person class contains the descriptions of people and a narative of
# their life. 
class Person < ActiveRecord::Base
  @@description_fields = [:ic,:gender,:height,:build,:eye_colour,:hair_length, :hair_colour]
  has_many :event_people
  #@attribute events
  # @return [Relation<Event>] Narrative for this persons life
  has_many :events,
           :through => :event_people
  #@attribute case_files 
  # @return [Relation<CaseFile>] Cases this person was involved in
  has_many :case_files,
           -> {distinct},
           :through => :events
  validates :name,
            presence: true,
            length: {in: 5..200}
  validate :validate_birth_event_count,
           :validate_death_event_count
  attr_accessor :name
  has_many :aliases, dependent: :destroy
  accepts_nested_attributes_for :aliases,
                                allow_destroy: true

  def name
    begin
      aliases.default_name.first.name
    rescue
      aliases.first.name
    end
  end

  def name=(nom)
    a = aliases.
        find_or_create_by(
          person: self,
          name: nom
        )
    aliases.default_name.each do |p|
      p.default = false
      p.save
    end
    a.default = true
    a.save
  end
  #@attribute birth
  # @return [CollectionProxy<Event>] birth event of this person
  
  #@attribute death
  # @return [CollectionProxy<Event>] death event of this person
  
  #@attribute victim
  # @return [CollectionProxy<Event>] events where this person was
  # a victim
  
  #@attribute perpetrator
  # @return [CollectionProxy<Event>] events where this person was
  # a perpetrator
  
  #@attribute investigator
  # @return [CollectionProxy<Event>] events where this person was
  # an investigator  
  EventPerson.categories.each do |type|
    type = type[0].to_sym
    has_many type,
             -> {where 'event_people.category' => type},
             :through => :event_people,
             :source => :event
  end

  #@!attribute gender
  # @return [Symbol] The gender of this person. 
  enum gender: [
         :unknown,
         :male,
         :female,
         :asexual,
         :transmale,
         :transfemale
       ], _prefix: true
  #@!attribute eye
  # @return [Symbol] The eye colour of this person. 
  enum eye_colour: [
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
       ] , _suffix: 'eyes'
  #@!attribute height
  # @return [Symbol] The height of this person. 
  enum height: [
         :unknown,
         :dwarf,
         :short,
         :average,
         :tall
       ], _prefix:true
  #@!attribute weight
  # @return [Symbol] The weight of this person. 
  enum build: [
         :unknown,
         :slight,
         :average,
         :overweight,
         :obese
       ], _prefix:true
  #@!attribute hair_colour
  # @return [Symbol] The hair_colour of this person. 
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
  #@!attribute hair_length
  # @return [Symbol] The hair_length of this person. 
  enum hair_length: [
         :unknown,
         :bald,
         :short,
         :medium,
         :shoulderLength,
         :backLength
       ], _suffix: true
  #@!attribute moustache
  # @return [Symbol] The type of moustache the person had
  # @todo add types of moustache
  enum moustache: [
         :unknown,
         :none,
         :handleBar,
         :toothbrush,
       ],_prefix: true
  #@!attribute gender
  # @return [Symbol] The type of beard the person had
  # @todo add types of beard
  enum beard: [
         :unknown,
         :clean,
         :stubble,
         :soulPatch,
         :full,
         :muttonChops,
         :long,
         :medium
       ],_prefix: true
  #@!attribute ics
  # @return [Symbol] The ICS code of the person
  enum ic: [
         :unknown,
         :northEurope,
         :southEurope,
         :black,
         :westAsia,
         :eastAsia,
         :arabic
       ], _prefix: true
  def description
    description = {}
    @@description_fields.each do |v|
      attr = read_attribute v
      description[v] = attr unless
        attr == 'unknown'
    end
    return description
  end
  private 
  def validate_birth_event_count
    if self.birth.size > 1
      errors.add(:birth, :multipleBirthEvents)
    end
  end

  def validate_death_event_count
    if self.death.size > 1
      errors.add(:death, :multipleDeathEvents)
    end
  end
end
